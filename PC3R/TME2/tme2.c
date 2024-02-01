/**
* <code> tme2.c </code> 
* @author Haotian XUE  & HeJun CAO 
* @date 31 janv. 2024
* @Description
*
*/


#include <pthread.h>
#include "producer.h"
#include "consumer.h"

char* produits[5]={"pomme", "poire", "orange", "kiwi", "banane"};
int PROD_NB_THREAD=sizeof(produits)/sizeof(char*);

int CONS_NB_THREAD=3;
int TAILLE_TAPIS = 15;
int CIBLE_PRODUCTION=20;


int main(){

	/*** INITIALISATION DES VARIABLES***/
	pthread_t tidPROD[PROD_NB_THREAD];
	pthread_t tidCONS[CONS_NB_THREAD];
	int prodCreat =0;
	int consCreat =0;
	int terminaisonsPROD = 0;
	int terminaisonsCONS = 0;
	tapis tapis;
	int compteur = CIBLE_PRODUCTION*PROD_NB_THREAD;
	pthread_mutex_t  comptLock;
	pthread_mutex_init(&comptLock, NULL);


	mktapis(TAILLE_TAPIS,&tapis);

	while(prodCreat < PROD_NB_THREAD)
	{
		Producer* p = malloc(sizeof (Producer));
		p->nom_de_produit=produits[prodCreat];
		p->nb_actuel=0;
		p->nb_target= CIBLE_PRODUCTION;
		p->tapis=&tapis;
		pthread_create(&(tidPROD[prodCreat]), NULL, prodWork, p);
		prodCreat++;
	}

	while(consCreat < CONS_NB_THREAD)
	{
		Consumer* c = malloc(sizeof (Consumer));
		c->compteur=&compteur;
		c->id=consCreat;
		c->tapis=&tapis;
		pthread_create(&(tidCONS[consCreat]), NULL, consWork, c);
		consCreat++;
	}

	while(terminaisonsPROD < PROD_NB_THREAD)
	{
		pthread_join(tidPROD[terminaisonsPROD],NULL);
		terminaisonsPROD++;
	}

	while(terminaisonsCONS < CONS_NB_THREAD)
	{
		pthread_join(tidCONS[terminaisonsCONS],NULL);
		terminaisonsCONS++;
	}

	free(tapis.tab);
	pthread_cond_destroy(&tapis.cv_full);
	pthread_mutex_destroy(&tapis.mutex);
	printf("All Done\n");
	return 0;





}
























