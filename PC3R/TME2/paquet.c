/**
* <code> paquet.c </code> 
* @author Haotian XUE  & HeJun CAO 
* @date 31 janv. 2024
* @Description
*
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "paquet.h"




void createPaquet(paquet * p,const char* chaine){
    p->name = creatCopy(chaine);
}

void freePaquet(paquet * p){
    if(!p){
        free(p->name);
        free(p);
    }
}










