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
    pthread_mutex_t mutex;      //单一互斥锁
    pthread_cond_t cv_Pro;      //生产者锁
    pthread_cond_t cv_Cons;     //消费者锁
}tapis;

paquet* makepaquet(char* nom)       //初始化包裹
{
    paquet* p = (paquet*)malloc(sizeof(paquet));
    p->fruit = nom;
    return p;
}

tapis* maketapis(int maxsize)               //初始化传送带
{
    tapis* t = (tapis*)malloc(sizeof(tapis));
    t->capacity  = maxsize;
    t->nb = 0;
    t->fruits = (paquet**)malloc(maxsize*sizeof(paquet*));
    if (pthread_mutex_init(&t->mutex, NULL) != 0)
    {
		printf("\n mutex init failed\n");
    }

	if (pthread_cond_init(&t->cv_Pro, NULL) != 0)
    {
		printf("\n CV_Pro init failed\n");
    }


	if (pthread_cond_init(&t->cv_Cons, NULL) != 0)
    {
		printf("\n CV_Cons init failed\n");
    }
}

char* newcopy(const char * src){
	size_t n = strlen(src);
	char * dest = malloc((strlen(src)+1)*sizeof(char));
	for(size_t i=0; i <=n; ++i) dest[i]=src[i];
	return dest;
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
    if (t->nb != 0)
    {
        for (int i = 0 ; i < t->nb; i++)
        {
            free_paquet(&t->fruits[i]);
        }
    }
    free(t->fruits);
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
    if (t->nb == t->capacity)
    {
        t->capacity = t->capacity * 2;
        paquet* temp_p = (paquet*) malloc (t->capacity*sizeof(paquet));
        for (int i = 0; i < t->nb; i ++)
        {
            temp_p[i] = t->fruits[i];
        }
        t->fruits = temp_p;
    }
}

void pushTapis()
{

}

void popTapis()
{

}




int main()
{
    paquet* p = makepaquet("Hi!");
    tapis* t = maketapis(1);

    return 0;
}






