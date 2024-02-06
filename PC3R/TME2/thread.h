#ifndef THREADS_H
#define THREADS_H
#include "tapis.h"
#include<stdio.h>
#include<stdlib.h>
#include <string.h>
#include<unistd.h>

char * strConcat(const char * src1, const char * src2){
    int totalLength = strlen(src1) + strlen(src2) + 1;
    char * res = (char*) malloc(totalLength * sizeof(char));
    if (res == NULL) {
        printf("Allocation mémoire échouée\n");
        return NULL; 
    }
    strcpy(res, src1);
    strcat(res, src2);
    return res;
}

void reverse(char *s) {
    int i, j;
    char c;
    for (i = 0, j = strlen(s)-1; i < j; i++, j--) {
        c = s[i];
        s[i] = s[j];
        s[j] = c;
    }
}

char* itoa(int n) {
    char* s = (char*)malloc(100); 
    if (s == NULL) return NULL; 
    sprintf(s, "%d", n);
    reverse(s); 
    return s; 
}

struct terminaison{
    ft_event_t * cvTermine;
};

typedef struct messenger{
    int id;
    ft_scheduler_t * schedProd;
    ft_scheduler_t * schedCons;
    int * cpt;
    tapis * tapisProd;
    tapis * tapisCons;
    FILE * journalMes;
}thread_mess;

typedef struct prod{
    int id;
    ft_scheduler_t * schedProd;
    char * nomProduit;
    int cibleProduction;
    int nbProduction;
    tapis * tapis;
    FILE * journalProd;
} thread_prod;

typedef struct cons{
    ft_scheduler_t * schedCons;
    int id;
    int * cpt;
    tapis * tapis;
    ft_event_t * fin;
    FILE * journalCons;
}thread_cons;

void jobProd(void * prod){
    thread_prod * th_prod = (thread_prod*) prod;
    while(th_prod->cibleProduction != th_prod->nbProduction){
        paquet* p = (paquet*) malloc(sizeof(paquet));
        mkpaquet(p,strConcat(th_prod->nomProduit,itoa(th_prod->nbProduction)));
        pushTapis(th_prod->tapis,p);
        fprintf(th_prod->journalProd,"JOURNAL DE PRODUCTION: pushTapis de %s \n",p->nom);
        ft_thread_cooperate();
    }
    free(th_prod);
}

void jobCons(void * cons){
    thread_cons * th_cons = (thread_cons*) cons;
    while(*(th_cons->cpt) > 0){
        paquet* p = (paquet*) popTapis(th_cons->tapis);
        fprintf(th_cons->journalCons,"JOURNAL DE CONSOMMATION: C%d mange %s\n",th_cons->id,p->nom);
        (*th_cons->cpt)--;
        ft_thread_cooperate();
        free_paquet(p);
    }
    free(th_cons);
    // ft_thread_generate(*(th_cons->fin));
}

void jobMes(void * mes){
    thread_mess* th_mess = (thread_mess*) mes;
    ft_scheduler_t sched = ft_thread_scheduler();
	ft_thread_unlink();

	while((*(th_mess->cpt))>0){
		ft_thread_link(*th_mess->schedProd);
		paquet * p = defiler("messager ",th_mess->tapisProd);
		ft_thread_unlink();
		fprintf (th_mess->journalMes, "JOURNAL DE VOYAGE:voyage par %d de %s\n", th_mess->id, p->nom);
		printf("JOURNAL DE VOYAGE:voyage par %d de %s\n", th_mess->id, p->nom);
		ft_thread_link(*th_mess->schedCons);
		enfiler("messager", th_mess->tapisCons,p);
		ft_thread_unlink();
	}
	ft_thread_link(sched);
	free(th_mess);

}

void jobTerminaison(void * ter){
    ft_thread_await(ter);
}


#endif //TME2_THREADS_H