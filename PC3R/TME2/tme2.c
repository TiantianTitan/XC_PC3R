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
#include "./ft_v1.1"

// n threads producteurs qui fabriquent des paquets et les enfilents sur le tapis de production
#define NB_THREADS_PRODUCTEUR 5
// m threads consommateurs qui consomment les paquets depuis le tapis de consommation
#define NB_THREADS_CONSOMMATEUR 4
// p threads messagers qui transportent des paquets du tapis de production au tapis de consommation
#define NB_THREADS_MESSAGE 7
#define SIZE_TAPIS  5
#define NB_PRODUCTION 1

char * produits[5]={"pomme", "poire", "orange", "kiwi", "banane"};


int main(){

    ft_scheduler_t scheduler_producteur = ft_scheduler_create();
    ft_scheduler_t scheduler_consommateur = ft_scheduler_create();
    ft_scheduler_t scheduler_messager = ft_scheduler_create();


    ft_event_t cv_producteur = ft_event_create(scheduler_producteur);
    ft_event_t cv_consommateur = ft_event_create(scheduler_consommateur);
    ft_event_t cv_messager = ft_event_create(scheduler_messager);

    tapis tapisProd;
    tapis tapisCons;
    mktapis(SIZE_TAPIS,&tapisProd,&cv_producteur,"prod");
    mktapis(SIZE_TAPIS,&tapisCons,&cv_consommateur,"cons");
    
    FILE * journalProd = fopen("journal_production.txt","w");
    FILE * journalCons = fopen("journal_consommation.txt","w");
    FILE * journalMes = fopen("journal_messager.txt","w");

    pthread_mutex_t mut;
    pthread_cond_t cv;

    pthread_mutex_init(&mut,NULL);
    pthread_cond_init(&cv,NULL);

    ft_event_t finish = ft_event_create(scheduler_consommateur);

    int compteur = NB_PRODUCTION * NB_THREADS_PRODUCTEUR;

    // Producteurs
    int nb_prod =0;
    while(nb_prod < NB_THREADS_PRODUCTEUR){
        /* code */
    }


    // Consommateurs
    int nb_cons =0;
    while (nb_cons < NB_THREADS_CONSOMMATEUR)
    {
        /* code */
    }
    
    // Messagers
    int nb_mess =0;
    while (nb_mess < NB_THREADS_MESSAGE){
        /* code */
    }

    ft_event_t * fin;
    fin = &finish;
    ft_thread_t finThread = ft_thread_create(scheduler_consommateur,NULL,NULL,(void * ) fin);

    ft_scheduler_start(scheduler_producteur);
    ft_scheduler_start(scheduler_consommateur);
    ft_scheduler_start(scheduler_messager);
    pthread_join(ft_pthread(finThread),NULL);

    fclose(journalProd);
    fclose(journalCons);
    fclose(journalMes);


    return 0;






}


