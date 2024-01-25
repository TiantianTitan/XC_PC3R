#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <pthread.h>
#include <unistd.h>
#include <stdbool.h>



typedef struct paquet           //paquet de fruits      
{
    char* fruit;
} paquet;


/*
    Tapis doit implémenter FIFO, qui est la file d'attente avancée, qui est le mode premier entré, premier sorti.
    Il doit donc y avoir des opérations d’ajout et de suppression
    En matière de sécurité des données, des variables mutex et de condition sont requises
*/
typedef struct tapis            //Definition de tapis   
{
    paquet** fruits;            //tableau de fruits
    int capacity;               //maxsize
    int nb;                     //size actuel
    int index;                  //L'index de paquet à retirer
    pthread_mutex_t mutex;      
    pthread_cond_t cv_Full;      
    pthread_cond_t cv_Empty;     
}tapis;

paquet* makepaquet(char* nom)       //Initialiser une paquet
{
    paquet* p = (paquet*)malloc(sizeof(paquet));
    p->fruit = nom;        
    return p;
}

tapis* maketapis(int maxsize)               //Initialliser tapis
{
    tapis* t = (tapis*)malloc(sizeof(tapis));
    t->capacity  = maxsize;
    t->nb = 0;
    t->index = 0;
    t->fruits = (paquet**)malloc(maxsize*sizeof(paquet*));
    if (pthread_mutex_init(&t->mutex, NULL) != 0)
    {
		printf("\n mutex init failed\n");
    }

	if (pthread_cond_init(&t->cv_Full, NULL) != 0)
    {
		printf("\n cv_Full init failed\n");
    }


	if (pthread_cond_init(&t->cv_Empty, NULL) != 0)
    {
		printf("\n cv_Empty init failed\n");
    }
    return t;
}

void free_paquet(paquet* p)     
{
    if (p != NULL)
    {
        free(p->fruit);
        free(p);
    }
}

void free_tapis(tapis* t)       
{
    if (t != NULL)
    {
        for (int i = 0 ; i < t->nb; i++)
        {
            free_paquet(t->fruits[i]);
        }
    }
    free(t->fruits);
    pthread_mutex_destroy(&t->mutex);
    pthread_cond_destroy(&t->cv_Full);
    pthread_cond_destroy(&t->cv_Empty);
    free(t);
}

bool isEmpty(tapis* t)
{
    return (t->nb == 0);
}

bool isFull(tapis* t)
{
    return (t->nb == t->capacity);
}

void ensureCapacity(tapis *t)
{
    if (t->nb == t->capacity - 1)
    {
        t->capacity = t->capacity * 2;
        paquet** temp_p = (paquet**) malloc (t->capacity*sizeof(paquet*));
        for (int i = 0; i < t->nb; i ++)
        {
            temp_p[i] = t->fruits[i];
        }
        free(t->fruits);
        t->fruits = temp_p;
    }
}

void pushTapis(tapis* t, paquet* p)    
{
    pthread_mutex_lock(&t->mutex);
    while (isFull(t))                   
    {
        pthread_cond_wait(&t->cv_Full, &t->mutex);
    }

    if (isEmpty(t))
    {
        pthread_cond_signal(&t->cv_Empty);
    }
    ensureCapacity(t);            
    t->fruits[t->nb] = p;
    t->nb++;
    pthread_mutex_unlock(&t->mutex);    
}

paquet* popTapis(tapis* t)
{
    pthread_mutex_lock(&t->mutex);
    while (isEmpty(t))                  
    {
        pthread_cond_wait(&t->cv_Empty, &t->mutex);
    }

    if (isFull(t))
    {
        pthread_cond_signal(&t->cv_Full);
    }

    paquet* p = t->fruits[t->index];
    t->index++;
    t->nb--;

    pthread_mutex_unlock(&t->mutex);    
    return p;
}

size_t getNb(tapis* t)
{
    pthread_mutex_lock(&t->mutex);
    size_t sz = t->nb;
    pthread_mutex_unlock(&t->mutex);
    return sz;
}

typedef struct Producer
{
    char* paquet_nom;       
    int nb_target;          
    int nb_actuel;          
    tapis* t;               
}Producer;

typedef struct Consumer
{
    int id;
    int counter;
    tapis* t;
}Consumer;

Producer* creatProducer(char* fruit, int target, tapis* t)
{
    Producer* p = (Producer*)malloc(sizeof(Producer));
    p->paquet_nom = fruit;
    p->t = t;
    p->nb_target = target;
    p->nb_actuel = 0;
    return p;
}

Consumer* creatConsumer(int id, int target, tapis* t)
{
    Consumer* c = (Consumer*)malloc(sizeof(Consumer));
    c->counter = target;
    c->t = t;
    c->id = id;
    return c;
}

void* ProWork(void* args)
{
    Producer* p = args;
    while(p->nb_actuel != p->nb_target)
    {
        paquet* pa = makepaquet(p->paquet_nom);
        pushTapis(p->t,pa);
        p->nb_actuel++;
        printf("Producer created %d %s(s), it's index is %d, now tapis have %d fruits \n",p->nb_actuel,p->paquet_nom, p->t->nb+p->t->index, p->t->nb);
    }
    printf("Production of %s is finished ! \n", p->paquet_nom);
    return 0;
}

void* ConsWork(void* args)
{
    Consumer* c = args;
    printf("Consumer%d start \n", c->id);
    while(c->counter > 0)
    {
        paquet* p = popTapis(c->t);
        printf("Consumer%d mange un(e) %s, il reste %d, it's Number %d of tapis, tapis have %d reste !!!\n", c->id, p->fruit, c->counter-1, c->t->index, c->t->nb - c->t->index);
        c->counter--;
        //free_paquet(p);
    }
    printf("Consumer%d is finished ! \n", c->id);
    return 0;
}

void PrintTapis(tapis* t)
{
    for (int i = 0 ; i < t->nb; i++)
    {
        printf("Numer %i production is %s \n", i, t->fruits[i]->fruit);
    }
}

int main()
{
    pthread_t th_Producer[5];   
    pthread_t th_Consumer[3];   
    tapis* t = maketapis(1);   

    int terminationCons = 0;

    char * produits[5]={"pomme", "poire", "orange", "kiwi", "banane"};  //Types de fruits

    for (int i = 0 ; i < 5; i++)    
    {
        Producer* p = creatProducer(produits[i], 3, t);         
        pthread_create(&th_Producer[i],NULL,ProWork,p);         
    }
    
    
    for (int i = 0 ; i < 3; i++)    
    {
        Consumer* c = creatConsumer(i, 2, t);
        pthread_create(&th_Consumer[i], NULL, ConsWork, c);
    }
    


    for (int i = 0; i < 5; i++) 
    {
        pthread_join(th_Producer[i], NULL);
    }

    

    for (int i = 2; i >= 0; i--) 
    {
        pthread_join(th_Consumer[i], NULL);
    }
    


    free_tapis(t);

    return 0;
}
