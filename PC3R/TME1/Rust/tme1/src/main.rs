use std::collections::VecDeque;


const NB_PRODUCTEUR : usize = 5;
const NB_CONSOMMATEUR : usize = 4;
const CIBLE_PRODUCTEUR : usize = 2;
const TAILLE_TAPIS : usize = 10;


struct Paquet {
    name: String
}


struct Tapis {
    size : usize,
    capacity : usize,
    tapis : VecDeque<Paquet>
}

struct Compteur {
    count : usize
}

fn enfiler(){

}

fn defiler(){

}


fn main(){


    let tapis = Tapis{
        size : 0,
        capacity : TAILLE_TAPIS,
        tapis : VecDeque::new()
    };

    let compteur = Compteur{
        count : NB_PRODUCTEUR * CIBLE_PRODUCTEUR
    };

    for i in 0..NB_PRODUCTEUR{

    }

    for i in 0..NB_CONSOMMATEUR{
        
    }

    for i in 0..NB_PRODUCTEUR{

    }

    for i in 0..NB_CONSOMMATEUR{
        
    }








}

