#include "fthread.h"
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
ft_scheduler_t file_sched;
ft_event_t new_elem;
int processed = 0;
/*************************************/
void process_value (int v)
{
  int i,j;
  ft_thread_unlink ();
  for (i=0;i<PROCESSING;i++) j++;
  ft_thread_link (file_sched);
  put (v+1,&file);
  ft_thread_generate (new_elem);
}

void process (void *args)
{
  while (1) {
    if (size(file) > 0){
      int res = get (&file);
      if (res == CYCLES) {
	PRINT("result: %d\n",res);
	processed++;
	if (processed == PRODUCED) exit (0);
      }else{
	process_value(res);
      }
    }else{
      ft_thread_await (new_elem);
      if (size (file) == 0) ft_thread_cooperate ();
    }
  }
}

void produce (void *args)
{
  int v = 0;
  while (v < PRODUCED) {
    if (size(file) < FILE_SIZE) {
      put (0,&file);
      PRINT("%d produced\n",0);
      ft_thread_generate (new_elem);
      v++;
    }
    ft_thread_cooperate ();
  }
}

/*************************************/
int main (void)
{
   int i;
    ft_thread_t thread_array[MAX_THREADS];

   file_sched = ft_scheduler_create ();
   
   new_elem = ft_event_create (file_sched);

   for (i=0; i<MAX_THREADS; i++){
      thread_array[i] = ft_thread_create (file_sched,process,NULL,NULL);
   }
  
   ft_thread_create (file_sched,produce,NULL,NULL);

   ft_scheduler_start (file_sched);

   ft_exit ();
   return 0;
}

