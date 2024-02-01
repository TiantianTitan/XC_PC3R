#ifndef PRODUCER_H_
#define PRODUCER_H_

#include "tapis.h"
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

void* prodWork(void* args)
{
	Producer* prod = (Producer*) args;

	while (prod->nb_target != prod->nb_actuel)
	{
		paquet* p = (paquet*) malloc(sizeof(paquet));
		mkpaquet(p, ConcatStr( prod->nom_de_produit, IntToStr( prod->nb_actuel ) ) );
		popTapis(prod->tapis, p);
		printf("Producer created %s\n", p->nom);
		prod->nb_actuel++;
	}
	free(prod);
	return 0;
}

#endif