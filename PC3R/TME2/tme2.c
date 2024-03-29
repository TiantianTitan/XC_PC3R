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
#include "thread.h"
#include "fthread.h"

// n threads producteurs qui fabriquent des paquets et les enfilents sur le tapis de production
#define NB_THREADS_PRODUCTEUR 5
// m threads consommateurs qui consomment les paquets depuis le tapis de consommation
#define NB_THREADS_CONSOMMATEUR 4
// p threads messagers qui transportent des paquets du tapis de production au tapis de consommation
#define NB_THREADS_MESSAGE 7
#define SIZE_TAPIS  5
#define CIBLE_PRODUCTION 1

char * produits[5]={"pomme", "poire", "orange", "kiwi", "banane"};

int main(){

    ft_scheduler_t scheduler_producteur = ft_scheduler_create();
    ft_scheduler_t scheduler_consommateur = ft_scheduler_create();
    ft_scheduler_t scheduler_messager = ft_scheduler_create();


    ft_event_t cv_producteur = ft_event_create(scheduler_producteur);
    ft_event_t cv_consommateur = ft_event_create(scheduler_consommateur);
    // ft_event_t cv_messager = ft_event_create(scheduler_messager); event是一个condition variable,message无需等待和启动，任何情况都可以直接调用
    

    tapis tapisProd;
    tapis tapisCons;
    mktapis(SIZE_TAPIS,&tapisProd,&cv_producteur);
    mktapis(SIZE_TAPIS,&tapisCons,&cv_consommateur);
    
    FILE * journalProd = fopen("journal_production.txt","w");
    if (!journalProd) {
        perror("Erreur lors de l'ouverture de journal_production.txt");
        return -1; // Ou gestion d'erreur appropriée
    }
    FILE * journalCons = fopen("journal_consommation.txt","w");
    if (!journalCons) {
    perror("Erreur lors de l'ouverture de journal_Consommation.txt");
    return -1; // Ou gestion d'erreur appropriée
}
    FILE * journalMes = fopen("journal_messager.txt","w");
    if (!journalMes) {
    perror("Erreur lors de l'ouverture de journal_Messager.txt");
    return -1; // Ou gestion d'erreur appropriée
}


    ft_event_t finish = ft_event_create(scheduler_consommateur);

    int compteur = CIBLE_PRODUCTION * NB_THREADS_PRODUCTEUR;

    // Producteurs
    int prod_id =0;
    while(prod_id < NB_THREADS_PRODUCTEUR){
        // Initialiasation
        thread_prod * prod = malloc(sizeof(thread_prod));
        prod->id = prod_id;
        prod->nomProduit = produits[prod_id];
        prod->nbProduction = 0;
        prod->cibleProduction= CIBLE_PRODUCTION;
        prod->tapis = &tapisProd;
        prod->schedProd = &scheduler_producteur;
        prod->journalProd = journalProd;
        
        ft_thread_create(scheduler_producteur,jobProd,NULL,(void*) prod);
        prod_id++;
    }


    // Consommateurs
    int cons_id =0;
    while (cons_id < NB_THREADS_CONSOMMATEUR)
    {
        thread_cons* cons = malloc(sizeof(thread_cons));
        cons->schedCons = & scheduler_consommateur;
        cons->cpt = & compteur;
        cons->id = cons_id;
        cons->tapis = & tapisCons;
        cons->fin = &finish;
        cons->journalCons = journalCons;
        ft_thread_create(scheduler_consommateur,jobCons,NULL,(void*) cons);
        cons_id++;
    }
    
    // Messagers
    int mess_id =0;
    while (mess_id < NB_THREADS_MESSAGE){
        thread_mess * mess = malloc(sizeof(thread_mess));
        mess->cpt = & compteur;
        mess->id = mess_id;
        mess->journalMes = journalMes;
        mess->schedCons = & scheduler_consommateur;
        mess->schedProd = & scheduler_producteur;
        mess->tapisCons = & tapisCons;
        mess->tapisProd = & tapisProd;
        ft_thread_create(scheduler_messager,jobMes,NULL,(void*) mess); 
        mess_id++;
    }

    theFinish* args = malloc(sizeof(theFinish));
    args->finish = &finish;

    ft_thread_t finThread = ft_thread_create(scheduler_consommateur,fin_routine,NULL,(void * ) args);

    ft_scheduler_start(scheduler_producteur);
    ft_scheduler_start(scheduler_consommateur);
    ft_scheduler_start(scheduler_messager);
    
    pthread_join(ft_pthread(finThread),NULL);

    fclose(journalProd);
    fclose(journalCons);
    fclose(journalMes);

    return 0;

}


