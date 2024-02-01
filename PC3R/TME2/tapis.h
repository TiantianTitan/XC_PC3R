/**
* <code> tapis.h </code> 
* @author Haotian XUE  & HeJun CAO 
* @date 31 janv. 2024
* @Description
*
*/

#ifndef TAPIS_H_
#define TAPIS_H_
#include "paquet.h"
#include <pthread.h>



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

void mktapis(size_t maxsize, tapis* t)
{
	t->allocsize= maxsize;
	t->index=0;
	t->sz=0;
	t->tab = (paquet**)malloc( maxsize*sizeof( paquet ) );
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

paquet* pushTapis(tapis* t, int* compt)
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

void popTapis(tapis*t, paquet* p)
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



#endif /* TAPIS_H_ */




