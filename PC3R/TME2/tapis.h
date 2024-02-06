/**
* <code> tapis.h </code> 
* @author Haotian XUE  & HeJun CAO 
* @date 31 janv. 2024
* @Description
*
*/

#ifndef TAPIS_H_
#define TAPIS_H_
#include <stdlib.h>
#include <stdio.h>
#include "paquet.h"
#include "./ft_v1.1"



typedef struct
{
	paquet** tab;
	size_t allocsize;
	size_t index;
	size_t begin;
	size_t sz;
	ft_event_t* cv;


}tapis;

void mktapis(size_t maxsize, tapis* t, ft_event_t* cv, char * str)
{
	t->tab = (paquet**)malloc( maxsize*sizeof( paquet ) );
	t->allocsize= maxsize;
	t->index=0;
	t->sz=0;
	t->cv = cv;
	t->begin = 0;
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


paquet* popTapis(tapis* t, int* compt)
{
	 while(empty(t) && compt > 0){
        ft_thread_await(*t->cv);
		ft_thread_cooperate();
    }
    struct paquet * p = t->tab[t->begin];
    t->sz --;
    t->begin = (t->begin + 1) % t->allocsize;
    ft_scheduler_broadcast(*t->cv);
    return p;
}

void pushTapis(tapis*t, paquet* p)
{
  while(full(t)){
        ft_thread_await(*t->cv);
        ft_thread_cooperate();
    }
    t->tab[ (t->begin + t->sz) % t->allocsize ] = p;
    t->sz++;
    ft_thread_generate(*t->cv);
}



#endif /* TAPIS_H_ */




