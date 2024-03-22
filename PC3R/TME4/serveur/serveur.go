package main

import (
	"bufio"
	"fmt"
	"math/rand"
	"net"
	"os"
	"strconv"
	"strings"

	st "../client/structures"
	tr "./travaux"
)

var ADRESSE = "localhost"

var pers_vide = st.Personne{Nom: "", Prenom: "", Age: 0, Sexe: "M"}

var id_serv = make(map[int]*personne_serv)

// 服务器端存储的Personne的数据类型定义
type personne_serv struct {
	statut string
	afaire []func(st.Personne) st.Personne
	st.Personne
}

// 创建一个Personne对象，Prod生成的时候，客户端进行调用
func creer(id int) *personne_serv {
	pers := pers_vide                                                                   // 使用全局定义的空Personne对象作为新创建的personne_serv的模板。
	tableau_afaire := make([]func(st.Personne) st.Personne, 0)                          // 初始化一个空的工作列表。
	new_pers_serv := personne_serv{statut: "V", afaire: tableau_afaire, Personne: pers} // 创建一个新的personne_serv实例，状态设置为"V"。
	id_serv[id] = &new_pers_serv                                                        // 将新创建的实例与其ID关联并存储在全局map中。
	return &new_pers_serv                                                               // 返回新创建的实例的指针。
}

func (p *personne_serv) initialise() {
	p.Personne = st.Personne{Prenom: "StarPlatinum", Nom: "TheWorld", Sexe: "M", Age: 18} // 使用预定义的值初始化Personne字段。
	for i := 0; i <= rand.Intn(6); i++ {                                                  // 生成0到6之间的随机数，确定要添加的工作数量。
		p.afaire = append(p.afaire, tr.UnTravail()) // 随机添加工作到待办列表。
	}
	p.statut = "R" // 设置状态为"R"表示就绪。
}

func (p *personne_serv) travaille() {
	p.Personne = p.afaire[0](p.Personne) // 执行待办列表中的第一个工作，并更新Personne字段。
	p.afaire = p.afaire[1:]              // 移除已完成的工作。
	if len(p.afaire) == 0 {              // 检查待办列表是否为空。
		p.statut = "C" // 如果完成所有工作，设置状态为"C"表示完成。
	}
}

func (p *personne_serv) vers_string() string {
	var add string
	if p.Personne.Sexe == "F" {
		add = "Mme "
	} else {
		add = "M "
	}
	return fmt.Sprint(add, p.Personne.Prenom, " ", p.Personne.Nom, " : ", p.Personne.Age, " ans. ")
}

func (p *personne_serv) donne_statut() string {
	return p.statut
}

// 维护id和Personne之间的goroutine
func mainteneur(methode string, id int, retourChan chan string) {
	switch methode {
	case "creer":
		creer(id)
		retourChan <- "ok"
	case "initialise":
		id_serv[id].initialise()
		retourChan <- "ok"
	case "travaille":
		id_serv[id].travaille()
		retourChan <- "ok"
	case "vers_string":
		retourChan <- id_serv[id].vers_string()
	case "donne_statut":
		retourChan <- id_serv[id].donne_statut()
	}
}

// 连接函数
// 它在 socket i上等待包含方法名称和id的消息，并用这些参数调用
// 它从维护器中获取结果并将其发送到socket，然后关闭socket
func gere_connection(conn net.Conn) {
	for {
		message, _ := bufio.NewReader(conn).ReadString('\n') // 从连接读取一行消息。
		requete := strings.TrimSuffix(message, "\n")         // 移除消息末尾的换行符。
		if len(requete) < 1 {                                // 如果消息长度小于1，即为空消息，则退出循环。
			break
		}
		args := strings.Split(requete, ",")               // 将消息按逗号分割成参数。
		fmt.Println("Requête reçu de client: " + requete) // 打印接收到的请求。
		id, _ := strconv.Atoi(args[0])                    // 将第一个参数转换为int类型的ID。
		methode := args[1]                                // 获取方法名。
		reponseChan := make(chan string)                  // 创建一个新的响应通道。
		go func() {
			mainteneur(methode, id, reponseChan) // 在一个新的协程中调用mainteneur函数处理请求。
		}()
		reponse := <-reponseChan           // 等待响应。
		conn.Write([]byte(reponse + "\n")) // 将响应写回到连接中。
	}
}

func main() {
	if len(os.Args) < 2 { // 检查命令行参数的数量。
		fmt.Println("Format: client <port>")
		return
	}
	port, _ := strconv.Atoi(os.Args[1])      // 获取端口号。
	addr := ADRESSE + ":" + fmt.Sprint(port) // 构造完整的地址。

	ln, _ := net.Listen("tcp", addr) // 在指定地址监听TCP连接。
	fmt.Println("Ecoute sur", addr)  // 打印监听地址。
	for {
		conn, _ := ln.Accept()                 // 接受一个新的连接。
		fmt.Println("Accepte une connection.") // 打印接受连接的消息。
		go gere_connection(conn)               // 为每个连接启动一个新的协程处理。
	}
}
