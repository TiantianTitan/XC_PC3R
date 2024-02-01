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



typedef struct tapis
{
    /* data */
    char* name_tapis;
    paquet ** file;
    int capacity;
    pthread_cond_t * cv_full;
    pthread_cond_t * cv_empty;

}tapis;

void createTapis(tapis* tap, char* name_tapis, int capacity, pthread_cond_t* cv_full, pthread_cond_t* cv_empty);
void freeTapis(tapis* tap);

void enfiler(tapis* tap, paquet* paquet);
paquet * defiler(tapis* tap);










#endif /* TAPIS_H_ */




