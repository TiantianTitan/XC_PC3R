package main

//运行命令：  go run main.go 100

import (
	"bufio"   //文件读取
	"fmt"     //打印输出
	"os"      //文件操作权限
	"strconv" //字符转类型转换
	"strings"
	"time"
)

const NB_TRAVAILLERUS = 5 //线程数量

// paquet是火车的停站数据
type paquet struct {
	arrivee string //到达时间
	depart  string //出发时间
	arret   int    //停站时间，初始为0
}

// requet用于处理请求
type requete struct {
	recu   paquet      //接收到的火车停站数据
	retour chan paquet //返回处理后的结果
}

func lecteur(donneesChan chan string, file_name string) {
	file, err := os.Open(file_name)
	if err != nil {
		panic(err)
	}
	defer file.Close() //在return之后关闭文件
	scanner := bufio.NewScanner(file)
	scanner.Scan() //跳过第一行
	for scanner.Scan() {
		str := scanner.Text()
		donneesChan <- str //将读取到的数据发送到donneesChan
	}
}

// 数据处理部分
func travailleur(donneesChan chan string, serveurChan chan requete, redacteurChan chan paquet) {
	for {
		donnees := <-donneesChan //接收donneesChan里的数据
		go func(s string) {
			params := strings.Split(s, ",") //以","切割字符串

			p := paquet{arrivee: params[1], depart: params[2], arret: 0} //创建火车停站数据
			priveRetourChan := make(chan paquet)                         //创建相关chan

			serveurChan <- requete{recu: p, retour: priveRetourChan} //将停站数据发送给serveurChan

			paquetRetour := <-priveRetourChan //等待从serveur的处理结果
			redacteurChan <- paquetRetour     //将处理后的数据打包发送到redacteurChan
		}(donnees)

	}
}

func serveur(serveurChan chan requete) {
	for {
		req := <-serveurChan //读取serveurChan里的数据
		go func(r requete) {
			arrivee, _ := time.Parse("15:04:05", r.recu.arrivee) //按照24小时格式来处理信息
			depart, _ := time.Parse("15:04:05", r.recu.depart)   //同上，处理时间格式
			r.recu.arret = int(depart.Sub(arrivee).Seconds())    //出发-到达就是停站时间
			res := r.recu
			r.retour <- res //最后将处理过的数据打包发送回travailleur
		}(req) //这里也就是说，req就是r requete，上面的只是定义数据类型和名字，这里才是真正使用的数据
	}
}

// 计算总停站时间和平均时长
func redacteur(redacteurChan chan paquet, mainChan chan int) {
	counter := 0    //班次数量
	arretTotal := 0 //总时长
	for {
		select {
		case paquet := <-redacteurChan: //如果能够读取数据
			counter++
			arretTotal += paquet.arret //停站时间
		case <-mainChan: //如果从mainChan里接收到信息，就开始计算
			moyenne := arretTotal / counter
			fmt.Println("Temps d'arrêt Total: ", arretTotal)
			fmt.Println("Nombre de trains: ", counter)
			mainChan <- moyenne //将计算之后的平均数据发送到mainChan里
			return
		}
	}
}

func main() {
	if len(os.Args) < 2 {
		fmt.Println("Usage: <Time_Waiting>")
		return
	}

	donneesChan := make(chan string)
	serveurChan := make(chan requete)
	redacteurChan := make(chan paquet)
	mainChan := make(chan int)

	//固定读取stop_times.txt，将读到的数据传输到donneesChan里
	go func() {
		lecteur(donneesChan, "./stop_times.txt")
	}()

	//将donneesChan里的数据分批打包传输到serveurChan里和redacteurChan里
	for i := 0; i < NB_TRAVAILLERUS; i++ {
		go func() {
			travailleur(donneesChan, serveurChan, redacteurChan)
		}()
	}

	//处理时间格式以及停站事件之后，将数据打包成requet
	go func() {
		serveur(serveurChan)
	}()

	//计算班次，总时长，将平均时长发送到mainChan里
	go func() {
		redacteur(redacteurChan, mainChan)
	}()

	//文件运行仅有一个参数，就是main的睡眠时间，需要先进行水眠以保证所有的数据都被读取完之后再正常运行
	tempsAttente, _ := strconv.Atoi(os.Args[1])
	time.Sleep(time.Duration(tempsAttente) * time.Millisecond)

	//这里给mainChan输入值，激活redacteur里的第二个情况，开始进行计算并且返回平均值到mainChan里
	mainChan <- 0
	resultat := <-mainChan
	fmt.Println("Temps d'arrêt en moyenne: ", resultat)

}
