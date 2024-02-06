#ifndef THREADS_H
#define THREADS_H
#include "tapis.h"
#include<stdio.h>

struct terminaison{
    ft_event_t * cvTermine;
};

struct messenger{
    int id;
    ft_scheduler_t * schedProd;
    ft_scheduler_t * schedCons;
    int * cpt;
    tapis * tapisProd;
    tapis * tapisCons;
    FILE * journalMes;
};

struct prod{
    int id;
    ft_scheduler_t * schedProd;
    char * nomProduit;
    int cibleProduction;
    int nbProduction;
    tapis * tapis;
    FILE * journalProd;
};

struct cons{
    ft_scheduler_t * schedCons;
    int id;
    int * cpt;
    tapis * tapis;
    ft_event_t * fin;
    FILE * journalCons;
};

void jobProd(void * prod);

void jobCons(void * cons);

void jobMes(void * mes);

void jobTerminaison(void * ter);


#endif //TME2_THREADS_H