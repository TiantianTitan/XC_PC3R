package main

import (
	"bufio"
	"fmt"
	"log"
	"math/rand"
	"os"
	"regexp"
	"strconv"
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
	lectureChan chan message                    //接收数据
}

// paquet de personne distante, pour la Partie 2, implemente l'interface personne_int
type personne_dist struct {
	// A FAIRE
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
	separateur := regexp.MustCompile("\u0009")         //这个表格是用Tab作为分割的，对应的是\u009
	separation := separateur.Split(l, -1)              //将第l行的数据以Tab为分割，全部返回，存储到separation里
	naiss, _ := time.Parse("29/2/2024", separation[7]) //用29/2/2024这个时间格式读取时间，时间数据存储在[7]里
	a1, _, _ := time.Now().Date()                      //获取当前时间
	a2, _, _ := naiss.Date()                           //获取表格存储的时间
	agec := a1 - a2                                    //女人永远18岁！
	return st.Personne{Nom: separation[4], Prenom: separation[5], Sexe: separation[6], Age: agec}
}

// *** METHODES DE L'INTERFACE personne_int POUR LES PAQUETS DE PERSONNES ***

func (p *personne_emp) initialise() {
	// A FAIRE
	ret := make(chan string)
	p.lectureChan <- message{ligne: p.ligne, retourChan: ret} //从文本中检索第ligne行
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

/*
func (p personne_dist) initialise() {
	// A FAIRE
}

func (p personne_dist) travaille() {
	// A FAIRE
}

func (p personne_dist) vers_string() string {
	// A FAIRE
}

func (p personne_dist) donne_statut() string {
	// A FAIRE
}
*/

// *** CODE DES GOROUTINES DU SYSTEME ***

// Partie 2: contacté par les méthodes de personne_dist, le proxy appelle la méthode à travers le réseau et récupère le résultat
// il doit utiliser une connection TCP sur le port donné en ligne de commande

//func proxy() {
// A FAIRE
//}

// Partie 1 : contacté par la méthode initialise() de personne_emp, récupère une ligne donnée dans le fichier source
func lecteur(lectureChan chan message) {
	for {
		m := <-lectureChan
		file, err := os.Open(FICHIER_SOURCE)
		if err != nil {
			fmt.Println("Can not find the ficher ! \n")
		}
		scanner := bufio.NewScanner(file)
		//sauter la première ligne
		_ = scanner.Scan()
		//sauter les premières m.ligne-ième lignes
		for i := 0; i < m.ligne; i++ {
			_ = scanner.Scan()
		}
		result := scanner.Scan()
		if result == false {
			if scanner.Err() != nil {
				// 如果扫描过程中发生错误，则报告扫描错误
				log.Fatal(scanner.Err())
			} else {
				// 如果没有错误，但是没有更多的行可以读取，可能是因为指定的行号超出了文件范围
				log.Fatal("No more lines to read or line number exceeds file size")
			}
		} else {
			m.retourChan <- scanner.Text()
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
		personne := <-deGest
		if personne.donne_statut() == "V" {
			personne.initialise()
			versGest <- personne
		} else if personne.donne_statut() == "R" {
			personne.travaille()
			versGest <- personne
		} else {
			versCollec <- personne
		}
	}
}

// Partie 1: les producteurs cree des personne_int implementees par des personne_emp initialement vides,
// de statut V mais contenant un numéro de ligne (pour etre initialisee depuis le fichier texte)
// la personne est passée aux gestionnaires
func producteur(lectureChan chan message, prodChan chan personne_int) {
	// A FAIRE
	for {
		personne := personne_emp{ligne: rand.Intn(TAILLE_SOURCE), Personne: pers_vide, aFaire: make([]func(st.Personne) st.Personne, 0), statut: "V", lectureChan: lectureChan}
		prodChan <- personne_int(&personne)
	}
}

// Partie 2: les producteurs distants cree des personne_int implementees par des personne_dist qui contiennent un identifiant unique
// utilisé pour retrouver l'object sur le serveur
// la creation sur le client d'une personne_dist doit declencher la creation sur le serveur d'une "vraie" personne, initialement vide, de statut V

//func producteur_distant() {
// A FAIRE
//}

// Partie 1: les gestionnaires recoivent des personne_int des producteurs et des ouvriers et maintiennent chacun une file de personne_int
// ils les passent aux ouvriers quand ils sont disponibles
// ATTENTION: la famine des ouvriers doit être évitée: si les producteurs inondent les gestionnaires de paquets, les ouvrier ne pourront
// plus rendre les paquets surlesquels ils travaillent pour en prendre des autres
func gestionnaire(deProd chan personne_int, versOuvrier chan personne_int, deOuvrier chan personne_int) {
	// A FAIRE
	queue := make([]personne_int, 0)
	for {
		if len(queue) == TAILLE_G {
			//full
			versOuvrier <- queue[0]
			queue = queue[1:]
		} else if len(queue) == 0 {
			//vide
			select {
			case personne := <-deProd:
				queue = append(queue, personne)
			case personne := <-deOuvrier:
				queue = append(queue, personne)
			}
		} else if len(queue) < TAILLE_G-1 {
			//2 places pour paquet de ouvrier
			select {
			case personne := <-deProd:
				queue = append(queue, personne)
			case personne := <-deOuvrier:
				queue = append(queue, personne)
			case versOuvrier <- queue[0]:
				queue = queue[1:]
			}
		} else {
			//pas assez de places pour paquet de producteur
			select {
			case personne := <-deOuvrier:
				queue = append(queue, personne)
			case versOuvrier <- queue[0]:
				queue = queue[1:]
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
		case personne := <-versCollecteur:
			journal += personne.vers_string() + "\n"
		case <-mainChan:
			fmt.Println("Journal:\n" + journal)
			mainChan <- 0
			return
		}
	}
}

func main() {
	rand.Seed(time.Now().UTC().UnixNano()) // graine pour l'aleatoire
	/*if len(os.Args) < 3 {
		fmt.Println("Format: client <port> <millisecondes d'attente>")
		return
	}*/
	//port, _ := strconv.Atoi(os.Args[1])   // utile pour la partie 2
	millis, _ := strconv.Atoi(os.Args[2]) // duree du timeout
	fintemps := make(chan int)
	// A FAIRE
	// creer les canaux
	// lancer les goroutines (parties 1 et 2): 1 lecteur, 1 collecteur, des producteurs, des gestionnaires, des ouvriers
	// creer les canaux
	lectureChan := make(chan message)
	deProdVersGest := make(chan personne_int)
	deGestVersOuvrier := make(chan personne_int)
	deOuvrierVersGest := make(chan personne_int)
	deOuvrierVersCollec := make(chan personne_int)
	// lancer les goroutines (parties 1 et 2): 1 lecteur, 1 collecteur, des producteurs, des gestionnaires, des ouvriers
	go func() {
		lecteur(lectureChan)
	}()
	go func() {
		collecteur(deOuvrierVersCollec, fintemps)
	}()
	for i := 0; i < NB_P; i++ {
		go func() {
			producteur(lectureChan, deProdVersGest)
		}()
	}
	for i := 0; i < NB_G; i++ {
		go func() {
			gestionnaire(deProdVersGest, deGestVersOuvrier, deOuvrierVersGest)
		}()
	}
	for i := 0; i < NB_O; i++ {
		go func() {
			ouvrier(deGestVersOuvrier, deOuvrierVersGest, deOuvrierVersCollec)
		}()
	}

	// lancer les goroutines (partie 2): des producteurs distants, un proxy

	time.Sleep(time.Duration(millis) * time.Millisecond)
	fintemps <- 0
	<-fintemps
}
