use std::collections::VecDeque;
use std::sync::{Arc, Mutex, Condvar};
use std::thread;

const PRODUITS: [&'static str; 10] = ["pomme","poire","banane","orange"
                                    ,"kiwi","peche","raisin", "ananas",
                                    "abricot","mangue"];
const NB_PRODUCTEUR : usize = 4;
const NB_CONSOMMATEUR : usize = 5;
const CIBLE_PRODUCTEUR : usize = 4;
const TAILLE_TAPIS : usize = 10;

struct Paquet {
    name: String
}

struct Tapis {
    tapis : VecDeque<Paquet>,
}

struct Compteur {
    count : usize,
}

fn desc_compteur(c: &mut Compteur){
    c.count -= 1;
}


fn enfiler(tapis: &Arc<(Mutex<Tapis>, Condvar)>, paquet: Paquet) {
    let (lock, cvar) = &**tapis;
    let mut tapis_locked = lock.lock().unwrap();

    while tapis_locked.tapis.len() == TAILLE_TAPIS {
        tapis_locked = cvar.wait(tapis_locked).unwrap();
    }

    tapis_locked.tapis.push_back(paquet);
    cvar.notify_one();
}


fn defiler(tapis: &Arc<(Mutex<Tapis>, Condvar)>) -> Option<Paquet> {
    let (lock, cvar) = &**tapis;
    let mut tapis_locked = lock.lock().unwrap();

    while tapis_locked.tapis.is_empty() {
        tapis_locked = cvar.wait(tapis_locked).unwrap();
    }

    let paquet = tapis_locked.tapis.pop_front();
    cvar.notify_one();
    paquet
}


fn main() {
    let tapis = Arc::new((
        Mutex::new(Tapis {
            tapis: VecDeque::new(),
        }),
        Condvar::new(),
    ));

    let compteur = Arc::new(Mutex::new(Compteur {
        count: NB_PRODUCTEUR * CIBLE_PRODUCTEUR,
    }));

    // Création des threads producteurs
    let mut producteurs = vec![];
    for i in 1..NB_PRODUCTEUR+1 {
        let tapis_clone = Arc::clone(&tapis);
        producteurs.push(thread::spawn(move || {
            // Du travail des producteurs
            for j in 1..CIBLE_PRODUCTEUR+1 {
                let paquet = Paquet { name: format!("{} No.{}", PRODUITS[i],j.to_string()) };
                println!("Producteur {} produit {}", i.to_string(),paquet.name);
                enfiler(&tapis_clone, paquet);
            }
        }));
    }

    // Création des threads consommateurs
    let mut consommateurs = vec![];
    for i in 1..NB_CONSOMMATEUR+1 {
        let tapis_clone = Arc::clone(&tapis);
        let compteur_clone = Arc::clone(&compteur);
        consommateurs.push(thread::spawn(move || {
        // Du travail des consommateurs
            while {
                let mut count = compteur_clone.lock().unwrap();
                if count.count > 0 {
                    desc_compteur(&mut *count);
                    true
                } else {
                    false
                }
            }
            {
                if let Some(paquet) = defiler(&tapis_clone) {
                    println!("C {} mange {}", i.to_string(), paquet.name.to_string());
                }
            }
        }));
    }

    // Attendre la fin des threads
    for producteur in producteurs {
        producteur.join().unwrap();
    }
    for consommateur in consommateurs {
        consommateur.join().unwrap();
    }
}

