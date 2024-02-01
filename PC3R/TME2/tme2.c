/**
* <code> tme2.c </code> 
* @author Haotian XUE  & HeJun CAO 
* @date 31 janv. 2024
* @Description
*
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <pthread.h>
#include "tapis.h"
#include "../ft_v1.0/include/fthread.h"

// n threads producteurs qui fabriquent des paquets et les enfilents sur le tapis de production
#define NB_THREADS_PRODUCTEUR 5
// m threads consommateurs qui consomment les paquets depuis le tapis de consommation
#define NB_THREADS_CONSOMMATEUR 4
// p threads messagers qui transportent des paquets du tapis de production au tapis de consommation
#define NB_THREADS_MESSAGE 7
#define SIZE_TAPIS  5

char * produits[5]={"pomme", "poire", "orange", "kiwi", "banane"};


int main(){

    ft_scheduler_t scheduler_producteur = ft_scheduler_create();
    ft_scheduler_t scheduler_consommateur = ft_scheduler_create();
    ft_scheduler_t scheduler_messager = ft_scheduler_create();


    ft_event_t cv_producteur = ft_event_create(scheduler_producteur);
    ft_event_t cv_consommateur = ft_event_create(scheduler_consommateur);
    ft_event_t cv_messager = ft_event_create(scheduler_messager);

    tapis tapisProd;
    tapis tapisCond;
    mktapis(SIZE_TAPIS,&tapisProd,&cv_producteur,"prod");
    mktapis(SIZE_TAPIS,&tapisCond,&cv_consommateur,"cons");
    










}
























