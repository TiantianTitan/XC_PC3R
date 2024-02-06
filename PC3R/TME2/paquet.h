/**
* <code> paquet.h </code> 
* @author Haotian XUE  & HeJun CAO 
* @date 31 janv. 2024
* @Description
*
*/


#ifndef PAQUET_H_
#define PAQUET_H_
#include "outil.h"

typedef struct paquet
{
	char* nom;
}paquet;



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

#endif /* PAQUET_H_ */