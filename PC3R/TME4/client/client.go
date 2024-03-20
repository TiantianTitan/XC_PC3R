package main

import (
	"bufio"
	"fmt"
	"log"
	"math/rand"
	"net"
	"os"
	"regexp"
	"strconv"
	"strings"
	"time"

	st "./structures" // contient la structure Personne
	tr "./travaux"    // contient les fonctions de travail sur les Personnes
)

var ADRESSE string = "localhost"                           // adresse de base pour la Partie 2
var FICHIER_SOURCE string = "./conseillers-municipaux.txt" // fichier dans lequel piocher des personnes
var TAILLE_SOURCE int = 4                                  // inferieure au nombre de lignes du fichier, pour prendre une ligne au hasard
var TAILLE_G int = 5                                       // taille du tampon des gestionnaires
var NB_G int = 2                                           // nombre de gestionnaires
var NB_P int = 2                                           // nombre de producteurs
var NB_O int = 4                                           // nombre d'ouvriers
var NB_PD int = 2                                          // nombre de producteurs distants pour la Partie 2

var pers_vide = st.Personne{Nom: "", Prenom: "", Age: 0, Sexe: "M"} // une personne vide

type message struct {
	ligne      int         //正在读取第几行
	retourChan chan string // 读取内容的返回接口
}

// paquet de personne, sur lequel on peut travailler, implemente l'interface personne_int
type personne_emp struct {
	// A FAIRE
	ligne       int                             //根据要求，显示这是文件里数据的第几行
	statut      string                          //根据题目里的要求，将paquet的状态转换成R
	st.Personne                                 //根据题目要求，得有个人
	aFaire      []func(st.Personne) st.Personne //这里的意思是，一个存储函数的表格，函数的参数类型是Persone，返回也是Persone，实际上类似于C++里的私有函数，Personne.add之类的
	lectureChan chan message                    //发送数据用
}

type message_proxy struct {
	identifiant int
	retourChan  chan string // socket TCP
	methode     string
}

// paquet de personne distante, pour la Partie 2, implemente l'interface personne_int
type personne_dist struct {
	identifiant int
	proxy       chan message_proxy
}

// interface des personnes manipulees par les ouvriers, les
type personne_int interface {
	initialise()          // appelle sur une personne vide de statut V, remplit les champs de la personne et passe son statut à R
	travaille()           // appelle sur une personne de statut R, travaille une fois sur la personne et passe son statut à C s'il n'y a plus de travail a faire
	vers_string() string  // convertit la personne en string
	donne_statut() string // renvoie V, R ou C
}

// fabrique une personne à partir d'une ligne du fichier des conseillers municipaux
// à changer si un autre fichier est utilisé
func personne_de_ligne(l string) st.Personne {
	separateur := regexp.MustCompile("\u0009")        //这个表格是用Tab作为分割的，对应的是\u009
	separation := separateur.Split(l, -1)             //将第l行的数据以Tab为分割，全部返回，存储到separation里
	naiss, _ := time.Parse("2/1/2006", separation[7]) //用29/2/2024这个时间格式读取时间，时间数据存储在[7]里
	a1, _, _ := time.Now().Date()                     //获取当前时间
	a2, _, _ := naiss.Date()                          //获取表格存储的时间
	agec := a1 - a2                                   //女人永远18岁！
	return st.Personne{Nom: separation[4], Prenom: separation[5], Sexe: separation[6], Age: agec}
}

// *** METHODES DE L'INTERFACE personne_int POUR LES PAQUETS DE PERSONNES ***

func (p *personne_emp) initialise() {
	// A FAIRE
	ret := make(chan string)
	p.lectureChan <- message{ligne: p.ligne, retourChan: ret} //将这个人是第几行，使用的哪个Chan进行标注
	ligne := <-ret                                            //提取数据
	p.Personne = personne_de_ligne(ligne)                     //转换成Personne
	for i := 0; i < rand.Intn(6)+1; i++ {                     //添加随机任务
		p.aFaire = append(p.aFaire, tr.UnTravail())
	}
	p.statut = "R" //状态转换
}

func (p *personne_emp) travaille() {
	// A FAIRE
	p.Personne = p.aFaire[0](p.Personne) //按顺序执行aFaire里的任务
	p.aFaire = p.aFaire[1:]              //提取了第一个之后，保留剩下的
	if len(p.aFaire) == 0 {              //如果做完了，更新状态成C
		p.statut = "C"
	}
}

func (p *personne_emp) vers_string() string {
	var add string

	if p.Personne.Sexe == "F" {
		add = "Mme "
	} else {
		add = "M "
	}
	return fmt.Sprint(add, p.Personne.Prenom, " ", p.Personne.Nom, " : ", p.Personne.Age, " ans, statut est ", p.statut)
}

func (p *personne_emp) donne_statut() string {
	return p.statut
}

// *** METHODES DE L'INTERFACE personne_int POUR LES PAQUETS DE PERSONNES DISTANTES (PARTIE 2) ***
// ces méthodes doivent appeler le proxy (aucun calcul direct)

func (p personne_dist) initialise() {
	retour := make(chan string)
	message := message_proxy{identifiant: p.identifiant, methode: "initialise", retourChan: retour}
	p.proxy <- message
	<-retour
}

func (p personne_dist) travaille() {
	retour := make(chan string)
	message := message_proxy{identifiant: p.identifiant, methode: "travaille", retourChan: retour}
	p.proxy <- message
	<-retour
}

func (p personne_dist) vers_string() string {
	retour := make(chan string)
	message := message_proxy{identifiant: p.identifiant, methode: "vers_string", retourChan: retour}
	p.proxy <- message
	return <-retour
}

func (p personne_dist) donne_statut() string {
	retour := make(chan string)
	message := message_proxy{identifiant: p.identifiant, methode: "donne_statut", retourChan: retour}
	p.proxy <- message
	return <-retour
}

// *** CODE DES GOROUTINES DU SYSTEME ***

// Partie 2: contacté par les méthodes de personne_dist, le proxy appelle la méthode à travers le réseau et récupère le résultat
// il doit utiliser une connection TCP sur le port donné en ligne de commande

func proxy(port string, requeteChan chan message_proxy) {
	address := ADRESSE + ":" + port
	conn, _ := net.Dial("tcp", address)
	for {
		message := <-requeteChan
		requete := strconv.Itoa(message.identifiant) + "," + message.methode + "\n"
		fmt.Fprintf(conn, fmt.Sprintf(requete))
		recu, _ := bufio.NewReader(conn).ReadString('\n')
		reponse := strings.TrimSuffix(recu, "\n")
		fmt.Println("Réponse reçu du serveur: " + reponse)
		message.retourChan <- reponse
	}
	conn.Close()
}

// Partie 1 : contacté par la méthode initialise() de personne_emp, récupère une ligne donnée dans le fichier source
func lecteur(lectureChan chan message) {
	for {
		m := <-lectureChan                   //m首先接收lectureChan里的内容，接收到之后才会有下一步
		file, err := os.Open(FICHIER_SOURCE) //打开文件，打不开就报错找不到
		if err != nil {
			fmt.Println("Can not find the ficher ! \n")
		}
		scanner := bufio.NewScanner(file) //逐行读取文件内容
		_ = scanner.Scan()                //跳过第一行
		for i := 0; i < m.ligne; i++ {    //然后继续跳过，直到到达第m.ligne行
			_ = scanner.Scan()
		}
		result := scanner.Scan() //读取内容
		if result == false {     //检查读取是否失败
			if scanner.Err() != nil {
				log.Fatal(scanner.Err()) // 如果扫描过程中发生错误，则报告扫描错误
			} else {
				log.Fatal("No more lines to read or line number exceeds file size") // 如果没有错误，但是没有更多的行可以读取，可能是因为指定的行号超出了文件范围
			}
		} else {
			m.retourChan <- scanner.Text() //将数据发送到m.retourChan里
		}
		_ = file.Close()
	}
}

// Partie 1: récupèrent des personne_int depuis les gestionnaires, font une opération dépendant de donne_statut()
// Si le statut est V, ils initialise le paquet de personne puis le repasse aux gestionnaires
// Si le statut est R, ils travaille une fois sur le paquet puis le repasse aux gestionnaires
// Si le statut est C, ils passent le paquet au collecteur
func ouvrier(deGest chan personne_int, versGest chan personne_int, versCollec chan personne_int) {
	// A FAIRE
	for {
		personne := <-deGest                //如果接收到personne_int类型的数据
		if personne.donne_statut() == "V" { //如果没活儿干
			personne.initialise() //分配任务
			versGest <- personne  //将新的牛马信息发给Gestionaire
		} else if personne.donne_statut() == "R" { //如果活儿没干完
			personne.travaille() //督促牛马赶紧干活儿
			versGest <- personne //让牛马继续接收天龙人的监督
		} else {
			versCollec <- personne //干完了就该被收起来当废品卖了（优化员工，向社会输送人才）
		}
	}
}

// Partie 1: les producteurs cree des personne_int implementees par des personne_emp initialement vides,
// de statut V mais contenant un numéro de ligne (pour etre initialisee depuis le fichier texte)
// la personne est passée aux gestionnaires
func producteur(lectureChan chan message, prodChan chan personne_int) {
	// A FAIRE
	for {
		personne := personne_emp{ //不停的创建新的牛马，为社会提供稳定GDP
			ligne:       rand.Intn(TAILLE_SOURCE),
			Personne:    pers_vide,
			aFaire:      make([]func(st.Personne) st.Personne, 0),
			statut:      "V",
			lectureChan: lectureChan,
		}
		prodChan <- personne_int(&personne) //将新的牛马写入prodChan
	}
}

// Partie 2: les producteurs distants cree des personne_int implementees par des personne_dist qui contiennent un identifiant unique
// utilisé pour retrouver l'object sur le serveur
// la creation sur le client d'une personne_dist doit declencher la creation sur le serveur d'une "vraie" personne, initialement vide, de statut V

func producteur_distant(deProdVersGest chan personne_int, requeteChan chan message_proxy, id_frais_chan chan int) {
	for {
		id := <-id_frais_chan
		new_pers := personne_dist{identifiant: id, proxy: requeteChan}
		retour := make(chan string)
		requeteChan <- message_proxy{identifiant: id, methode: "creer", retourChan: retour}
		<-retour
		deProdVersGest <- new_pers
	}
}

// Partie 1: les gestionnaires recoivent des personne_int des producteurs et des ouvriers et maintiennent chacun une file de personne_int
// ils les passent aux ouvriers quand ils sont disponibles
// ATTENTION: la famine des ouvriers doit être évitée: si les producteurs inondent les gestionnaires de paquets, les ouvrier ne pourront
// plus rendre les paquets surlesquels ils travaillent pour en prendre des autres
func gestionnaire(deProd chan personne_int, versOuvrier chan personne_int, deOuvrier chan personne_int) {
	// A FAIRE
	queue := make([]personne_int, 0) //牛马哪怕入圈也得排队呐，队伍初始化为0个牛马
	for {
		if len(queue) == TAILLE_G { //对不起，想做牛马的太多了，你往后稍稍
			//full
			versOuvrier <- queue[0] //TMD牛马怎么这么多？排第一的那个谁，滚去焚化炉里分解！
			queue = queue[1:]       //人都走了还想占着房？一起烧了，给下一个牛马腾腾位置！
		} else if len(queue) == 0 { //哎哟这位爷里面请，咱们现在正缺牛马，啊不是，高端人才呢
			//vide
			select {
			case personne := <-deProd: //哎哟？大学里新出来的崭新牛马？来来来叔叔给你安排岗位
				queue = append(queue, personne)
			case personne := <-deOuvrier: //晦气，怎么是个干完活儿的老油条，速去焚化炉！
				queue = append(queue, personne) //实际上没有区别，加到queue里就是等死
			}
		} else if len(queue) < TAILLE_G-1 { //还有起码两个位置，你不干有的是牛马干！3000月薪速速来人！
			//2 places pour paquet de ouvrier
			select {
			case personne := <-deProd:
				queue = append(queue, personne)
			case personne := <-deOuvrier:
				queue = append(queue, personne)
			case versOuvrier <- queue[0]: //试试看能不能把老牛马优化出去
				queue = queue[1:] //哟？赶走了？赶紧的下一位！
			}
		} else { //只有一个位置了啊！不是QS前五十的牛马咱们看都不看啊！
			select {
			case personne := <-deOuvrier: //牛马太多了，嘴上说要，大学的崭新牛马给个面试就很好了，爬！
				queue = append(queue, personne)
			case versOuvrier <- queue[0]: //老牛马怎么还不死！没位置履行我们公司的社会职责了！
				queue = queue[1:] //总算死了，有位置咯~
			}
		}
	}
}

// Partie 1: le collecteur recoit des personne_int dont le statut est c, il les collecte dans un journal
// quand il recoit un signal de fin du temps, il imprime son journal.
func collecteur(versCollecteur chan personne_int, mainChan chan int) {
	// A FAIRE
	var journal string
	for {
		select {
		case personne := <-versCollecteur: //如果接收到别人发来的牛马
			journal += personne.vers_string() + "\n" //添加到输出
		case <-mainChan: //尝试发送给main
			fmt.Println("Journal:\n" + journal) //输出
			mainChan <- 0
			return
		}
	}
}

/*
lecture函数负责接收lectureChan里的数据，并且将数据发送回message.retourChan
ouvrier函数负责接收deGest里的数据，并且将数据发送给verGest和verCollec
producteur函数负责向prodChan发送数据，并且将新创建的Personne的lectureChan和主体进行连接
gestionnaire函数负责接收deProd和deProd里的数据，并且将数据发送给versOuvrir

*/

func main() {
	rand.Seed(time.Now().UTC().UnixNano()) // graine pour l'aleatoire
	if len(os.Args) < 3 {
		fmt.Println("Format: client <port> <millisecondes d'attente>")
		return
	}

	port, _ := strconv.Atoi(os.Args[1]) // utile pour la partie 2

	millis, _ := strconv.Atoi(os.Args[2]) // duree du timeout
	fintemps := make(chan int)

	// creer les canaux
	lectureChan := make(chan message)
	deProdVersGest := make(chan personne_int)
	deGestVersOuvrier := make(chan personne_int)
	deOuvrierVersGest := make(chan personne_int)
	deOuvrierVersCollec := make(chan personne_int)

	// Partie 2: un proxy entre personne_dist et fonction proxy()
	// et un generator d'uniques identifiants (fabriquer identifiant dans un goroutine puis envoyer cet identifiant vers un canal)
	requeteChan := make(chan message_proxy)
	id_frais_chan := make(chan int)

	// lancer les goroutines (parties 1 et 2): 1 lecteur, 1 collecteur, des producteurs, des gestionnaires, des ouvriers

	//开局lecture是会被阻塞的，因为lectureChan是空的
	//直到producteur启动之后，接收到lectureChan里的数据，开始读取并且返回到retourChan里
	//激活initialise函数，创建人的实体
	go func() {
		lecteur(lectureChan)
	}()

	//同理，一样被阻塞
	//最后，接收到牛马的焚化炉对牛马进行摧毁（输出）
	go func() {
		collecteur(deOuvrierVersCollec, fintemps)
	}()

	//到了这里，整个函数才开始启动，producteur创新新人，给lectureChan和deProdVersGest都发送了数据
	//initialise激活之后才能够将数据发送到deProdVersGest里
	for i := 0; i < NB_P; i++ {
		go func() {
			producteur(lectureChan, deProdVersGest)
		}()
	}

	//接下来，接收到deProdVersGest的数据之后，将数据加入queue里，并且尝试将原有的数据发送到deGestVersOuvrier里
	for i := 0; i < NB_G; i++ {
		go func() {
			gestionnaire(deProdVersGest, deGestVersOuvrier, deOuvrierVersGest)
		}()
	}

	//接下来，被deGestVersOuvrier里的数据激活之后，根据状态选择发回gest还是直接发给collecteur
	for i := 0; i < NB_O; i++ {
		go func() {
			ouvrier(deGestVersOuvrier, deOuvrierVersGest, deOuvrierVersCollec)
		}()
	}

	// lancer les goroutines (partie 2): des producteurs distants, un generator d'identifiant, un proxy
	go func() {
		proxy(strconv.Itoa(port), requeteChan)
	}()
	go func() {
		compteur := 0
		for {
			id_frais_chan <- compteur
			compteur++
		}
	}()
	for i := 0; i < NB_PD; i++ {
		go func() {
			producteur_distant(deProdVersGest, requeteChan, id_frais_chan)
		}()
	}

	time.Sleep(time.Duration(millis) * time.Millisecond)
	fintemps <- 0
	<-fintemps
}
