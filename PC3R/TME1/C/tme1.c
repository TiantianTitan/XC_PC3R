#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <pthread.h>
#include <unistd.h>
#include <stdbool.h>



typedef struct paquet           //水果包裹
{
    char* fruit;
} paquet;


/*
    tapis必须实现FIFO，也就是先进队列，也就是先进者先出的模式
    故而必须要有加入和取出操作
    涉及到数据安全，需要有mutex和condition variable
*/
typedef struct tapis            //传送带
{
    paquet** fruits;             //包裹数组
    int capacity;               //最大容量
    int nb;                     //当前包裹数量
    int index;                  //拿取的下标
    pthread_mutex_t mutex;      //互斥锁
    pthread_cond_t cv_Full;      //满额锁
    pthread_cond_t cv_Empty;     //空锁
}tapis;

paquet* makepaquet(char* nom)       //初始化包裹
{
    paquet* p = (paquet*)malloc(sizeof(paquet));
    p->fruit = nom;        //用newcopy避免内存问题
    return p;
}

tapis* maketapis(int maxsize)               //初始化传送带
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

void free_paquet(paquet* p)     //清理内存
{
    if (p != NULL)
    {
        free(p->fruit);
        free(p);
    }
}

void free_tapis(tapis* t)       //清理内存
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

void pushTapis(tapis* t, paquet* p)    //生产者添加paquet
{
    pthread_mutex_lock(&t->mutex);
    while (isFull(t))                   //满了就等待解锁即可
    {
        pthread_cond_wait(&t->cv_Full, &t->mutex);
    }

    if (isEmpty(t))
    {
        // 通知消费者有新的 paquet 可用
        pthread_cond_signal(&t->cv_Empty);
    }
    ensureCapacity(t);             //确保容量
    t->fruits[t->nb] = p;
    t->nb++;
    pthread_mutex_unlock(&t->mutex);    //解锁
}

paquet* popTapis(tapis* t)
{
    pthread_mutex_lock(&t->mutex);
    while (isEmpty(t))                  // 等待直到有 paquet 可用
    {
        pthread_cond_wait(&t->cv_Empty, &t->mutex);
    }

    if (isFull(t))
    {
        pthread_cond_signal(&t->cv_Full);
    }
     // 从 tapis 中取出 paquet
    paquet* p = t->fruits[t->index];
    t->index++;
    t->nb--;
    // 通知生产者有空间可用
    pthread_mutex_unlock(&t->mutex);    //解锁
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
    char* paquet_nom;       //水果的名字
    int nb_target;          //目标数量
    int nb_actuel;          //当前实际数量
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
    pthread_t th_Producer[5];   //假设五个生产者
    pthread_t th_Consumer[3];   //三个吃货
    tapis* t = maketapis(1);   //假设传送带容量1

    int terminationCons = 0;

    char * produits[5]={"pomme", "poire", "orange", "kiwi", "banane"};  //水果种类

    for (int i = 0 ; i < 5; i++)    //创建生产者
    {
        Producer* p = creatProducer(produits[i], 3, t);         //每种水果都做3个
        pthread_create(&th_Producer[i],NULL,ProWork,p);         //创建线程
    }
    
    
    for (int i = 0 ; i < 3; i++)    //创建生产者
    {
        Consumer* c = creatConsumer(i, 2, t);
        pthread_create(&th_Consumer[i], NULL, ConsWork, c);
    }
    

    // 等待线程完成
    for (int i = 0; i < 5; i++) 
    {
        pthread_join(th_Producer[i], NULL);
    }

    
    // 等待线程完成
    for (int i = 2; i >= 0; i--) 
    {
        pthread_join(th_Consumer[i], NULL);
    }
    


    free_tapis(t);

    return 0;
}
