#ifndef CONSUMER_H_
#define CONSUMER_H_

#include "tapis.h"
typedef struct
{
	int id;
	int* compteur;
	tapis* tapis;
}Consumer;

void* consWork(void* args){
	Consumer* cons = (Consumer*)args;

	while((*(cons->compteur))>0)
	{
		paquet* p = pushTapis( cons->tapis, cons->compteur );
		printf("Consumer%d mange %s\n", cons->id, p->nom);
		free_paquet(p);
	}
	free(cons);
	return 0;
}
#endif