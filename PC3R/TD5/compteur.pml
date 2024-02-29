//Promela

#define LIMITE 10
#define NB_INC 10

int compteur = 0;

proctype incrementeur(chan fini){
	int i= 0
	int temp
	
	debut:

		atomic{
			i = i+1;
			temp = compteur;
			temp = temp + 1;
			compteur = temp
		}

		if 
			:: i < LIMITE -> goto debut
			:: i < NB_INC -> goto fin
		fi	
		

	fin: 
		fini!0
}

init
{
	int n, j
	chan fini = [0] of {int}
	for(j:1..10){
		run incrementeur(fini);
	}
	for(j:1..10){
		fini?n->printf("Fini\n")
	}

	assert compteur == LIMITE * NB_INC


	

}


// proctype incrementeur(int id ; chan fini ; chan obs){
// 	int i= 0
// 	int temp
	
// 	debut:

// 		atomic{
// 			i = i+1;
// 			temp = compteur;
// 			temp = temp + 1;
// 			compteur = temp
// 			obs!id,temp;
// 		}

// 		if 
// 			:: i < LIMITE -> goto debut
// 			:: i < NB_INC -> goto fin
// 		fi	
		

// 	fin: 
// 		fini!0
// }

// proctype observateur(chan obs; chan fini){
// 	int x,y
// 	int done = 0;
// 	debut:
// 		do
// 		:: obs?(x,y) -> printf("L'incrementeur %d a mis le compteur a %d.\n"x,y)
// 		:: fini?x -> printf("L'incrementeur %d a été fini.\n"x) done = done + 1
// }


// init
// {
// 	int n, j
// 	chan fini = [0] of {int}
	
// 	for(j:1..10){
// 		run incrementeur(fini);
// 	}
// 	for(j:1..10){
// 		fini?n->printf("Fini\n")
// 	}

// 	assert compteur == LIMITE * NB_INC
// }





