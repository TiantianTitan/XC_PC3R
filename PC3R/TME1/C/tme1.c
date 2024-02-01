/**
* <code> tme1.c </code> 
* @author HeJun CAO & Haotian XUE
* @date 25 janv. 2024
* @Description
*  Ce programme illustre une implémentation multithread du problème de producteurs-consommateurs en C en utilisant un tampon partagé, avec une attention particulière à la synchronisation et la gestion de la mémoire.
*/



#include<stdio.h>
#include<string.h>
#include<pthread.h>
#include<stdlib.h>
#include<unistd.h>

char* produits[5]={"pomme", "poire", "orange", "kiwi", "banane"};
int PROD_NB_THREAD=sizeof(produits)/sizeof(char*);

int CONS_NB_THREAD=3;
int TAILLE_TAPIS = 15;
int CIBLE_PRODUCTION=20;

typedef struct
{
	char* nom;
}paquet;

typedef struct
{
	paquet** tab;
	size_t allocsize;
	size_t index;
	size_t sz;
	pthread_mutex_t mutex;
	pthread_cond_t  cv_full;
	pthread_cond_t  cv_empty ;
}tapis;

char* newcopy(const char* src)
{
	size_t n = strlen( src );
	char* dest = malloc( (strlen( src ) +1 ) * sizeof( char ) );
	for(size_t i = 0; i <= n; ++i) 
    {
        dest[ i ]=src[ i ];
    }
	return dest;
}

void mkpaquet(paquet* p, char* str)
{
	p->nom = newcopy( str );
}

void free_paquet(paquet* p)
{
	if (p != NULL)
    {
	    free( p->nom );
	    free( p );
	}
}

void mktapis(size_t maxsize, tapis* t)
{
	t->allocsize= maxsize;
	t->index=0;
	t->sz=0;
	t->tab = (paquet**) malloc( maxsize*sizeof( paquet ) );
	pthread_mutex_init( &t->mutex, NULL );
    pthread_cond_init( &t->cv_empty, NULL );
	pthread_cond_init( &t->cv_full, NULL );
}

//Only used in push and pop, so dont need to use mutex
int empty(tapis* t)
{
	return ( t->sz == 0 );
}

int full(tapis* t)
{
	return ( t->sz == t->allocsize );
}

size_t size(tapis* t)
{
	pthread_mutex_lock( &t->mutex );
	size_t res = t->sz;
	pthread_mutex_unlock( &t->mutex );
	return res;
}


char* ConcatStr(char* src1, char* src2)
{
	int lengthSrc1 = strlen( src1 );
	int lengthSrc2 = strlen( src2 );
	char* res = malloc ( ( lengthSrc1 + lengthSrc2 + 1 ) * sizeof( char ) );
	for (int j=0; j < lengthSrc1; j++)
    {
        res [j] = src1[j];
    }
		
	for (int j = 0; src2[j] != '\0'; ++j, ++lengthSrc1)
    {
	    res [lengthSrc1] = src2[j];
    }
	
	res[lengthSrc1]='\0';
	return res;
}

int digitsInANumber(int i)
{
	int count =0;
	while( i != 0 )
	{
		count++;
		i /= 10;
	}
	return count;
}

char* IntToStr(int i)
{
	char* res = malloc( (digitsInANumber( i ) + 1 )*sizeof( char ) );
	sprintf(res, "%d", i);
	return res;
}

typedef struct
{
	char* nom_de_produit;
	int nb_target;           
	int nb_actuel;
	tapis* tapis;
}Producer;

void freeProducer(Producer* t)
{
	if( t != NULL )
    {
		free(t->nom_de_produit);
		free(t);
	}
}

typedef struct
{
	int id;
	int* compteur;
	tapis* tapis;
}Consumer;

paquet* popTapis(tapis* t, int* compt)
{
	pthread_mutex_lock(&t->mutex);
	while(empty(t)) 
	{
		pthread_cond_wait(&t->cv_empty , &t->mutex);
	}

	if(full(t)) 
	{
		pthread_cond_signal(&t->cv_full);
	}

	paquet* p = t->tab[t->index];
	t->sz--;
	t->index=(t->index+1)%t->allocsize;
	(*compt)--;
	pthread_mutex_unlock(&t->mutex);
	return p;
}

void pushTapis(tapis*t, paquet* p)
{
	pthread_mutex_lock(&t->mutex);
	while(full(t)) 
	{
		pthread_cond_wait(&t->cv_full , &t->mutex);
	}
	if(empty(t)) 
	{
		pthread_cond_signal(&t->cv_empty);
	}

	t->tab[ ( t->index+t->sz ) %t->allocsize ]=p;
	t->sz++;
	pthread_mutex_unlock(&t->mutex);
}

void* prodWork(void* args)
{
	Producer* prod = args;

	while (prod->nb_target != prod->nb_actuel)
	{
		paquet* p = malloc(sizeof(paquet));
		mkpaquet(p, ConcatStr( prod->nom_de_produit, IntToStr( prod->nb_actuel ) ) );
		pushTapis(prod->tapis, p);
		printf("Producer created %s\n", p->nom);
		prod->nb_actuel++;
	}
	free(prod);
	return 0;
}

void* consWork(void* args){
	Consumer* cons = (Consumer*)args;

	while((*(cons->compteur))>0)
	{
		paquet* p = popTapis( cons->tapis, cons->compteur );
		printf("Consumer%d mange %s\n", cons->id, p->nom);
		free_paquet(p);
	}
	free(cons);
	return 0;
}


int main(void) {

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
