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
	pers := pers_vide
	tableau_afaire := make([]func(st.Personne) st.Personne, 0)
	new_pers_serv := personne_serv{statut: "V", afaire: tableau_afaire, Personne: pers}
	id_serv[id] = &new_pers_serv
	return &new_pers_serv
}

func (p *personne_serv) initialise() {
	p.Personne = st.Personne{Prenom: "StarPlatinum", Nom: "TheWorld", Sexe: "M", Age: 18}
	for i := 0; i <= rand.Intn(6); i++ {
		p.afaire = append(p.afaire, tr.UnTravail())
	}
	p.statut = "R"
}

func (p *personne_serv) travaille() {
	p.Personne = p.afaire[0](p.Personne)
	p.afaire = p.afaire[1:]
	if len(p.afaire) == 0 {
		p.statut = "C"
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
		message, _ := bufio.NewReader(conn).ReadString('\n')
		requete := strings.TrimSuffix(message, "\n")
		if len(requete) < 1 {
			break
		}
		args := strings.Split(requete, ",")
		fmt.Println("Requête reçu de client: " + requete)
		id, _ := strconv.Atoi(args[0])
		methode := args[1]
		reponseChan := make(chan string)
		go func() {
			mainteneur(methode, id, reponseChan)
		}()
		reponse := <-reponseChan
		conn.Write([]byte(reponse + "\n"))
	}
}

func main() {
	if len(os.Args) < 2 {
		fmt.Println("Format: client <port>")
		return
	}
	port, _ := strconv.Atoi(os.Args[1])
	addr := ADRESSE + ":" + fmt.Sprint(port)

	ln, _ := net.Listen("tcp", addr)
	fmt.Println("Ecoute sur", addr)
	for {
		conn, _ := ln.Accept()
		fmt.Println("Accepte une connection.")
		go gere_connection(conn)
	}
}
