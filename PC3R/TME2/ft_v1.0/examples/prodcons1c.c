#include <pthread.h>
#include <sched.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include "prodcons1.h"

/*************************************/
typedef struct cell
{
   int value;
   struct cell *next;
}
*cell;

typedef struct list
{
   int length;
   cell first;
   cell last;
}
*list;

list add (int v, list l)
{
   cell c = (cell) malloc (sizeof (struct cell));
   c->value = v;
   c->next = NULL;

   if (l == NULL){
      l = (list) malloc (sizeof (struct list));
      l->length = 0;
      l->first = c;
   }else{
      l->last->next = c;
   }
   l->length++;
   l->last = c;
   return l;
}

void put (int v,list *l)
{
  (*l) = add (v,*l);
}

int get (list *l)
{
  int res;
  list file = *l;
  if (l == NULL) {
    fprintf (stderr, "get error!\n");
    return 0;
  }
  res = file->first->value;
  file->length--;
  if (file->last == file->first){
    file = NULL;
  }else{
    file->first = file->first->next;
  }
  return res;
}

int size (list l)
{
   if (l==NULL) return 0;
   return l->length;
}
/*************************************/
list file = NULL;
pthread_mutex_t file_mutex = PTHREAD_MUTEX_INITIALIZER;
pthread_cond_t new_elem  = PTHREAD_COND_INITIALIZER;
int processed = 0;

/*************************************/
void process_value (int v)
{
  int i,j;
  for (i=0;i<PROCESSING;i++) j++;
  pthread_mutex_lock(&file_mutex);
  put(v+1,&file);
  pthread_cond_signal (&new_elem);
  pthread_mutex_unlock(&file_mutex);
}

void* process (void *args)
{
  pthread_mutex_lock(&file_mutex);
  while (1) {
    if (size(file) > 0){
      int res = get (&file);
      pthread_mutex_unlock(&file_mutex);
      if (res == CYCLES){
	PRINT("result: %d\n",res);
	processed++;
	if (processed == PRODUCED) exit (0);
      }else{
	process_value(res);
      }
      pthread_mutex_lock(&file_mutex);      
    }else{
      pthread_cond_wait (&new_elem,&file_mutex);
    }
  }
  return NULL;
}

void* produce (void *args)
{
  int v = 0;
  while (v < PRODUCED) {
    pthread_mutex_lock (&file_mutex);
    if (size(file) < FILE_SIZE){
      put (0,&file);
      PRINT("%d produced\n",0);
      pthread_cond_signal (&new_elem);
      v++;
      pthread_mutex_unlock (&file_mutex);
    }else{
      pthread_mutex_unlock(&file_mutex);
      sched_yield();
    }
  }
  return NULL;
}

/*************************************/
int main(void)
{
   int i;
   pthread_t producer;
   pthread_t thread_array[MAX_THREADS];

   for (i=0; i<MAX_THREADS; i++){
      pthread_create (&thread_array[i],NULL,process,NULL);
   }

   pthread_create (&producer,NULL,produce,NULL);
   
   pthread_exit (0);
   return 0;
}

