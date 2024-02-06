#include "fthread.h"
#include <stdio.h>

/* A NOT cooperative thread linked to a scheduler only blocks this scheduler */

ft_scheduler_t sched1, sched2;
int i1 = 0, i2 = 0;

void f1 (void *args)
{
   while (1) {
     /* this thread is NOT cooperative !!!! */
   }
}

void f2 (void *args)
{
  ft_thread_cooperate_n (10);
  fprintf (stdout,"exit at instant (sched1: %d, sched2: %d)\n",i1,i2);
  exit (0);
}

void traceInstants (void *args)
{
   int *pi = (int*) args;
   while (1) {
      (*pi)++;
      ft_thread_cooperate ();
   }
}

int main (void)
{
  ft_thread_t th1, th2;
  
  sched1 = ft_scheduler_create ();
  sched2 = ft_scheduler_create ();  

  ft_thread_create (sched1,traceInstants,NULL,&i1);
  ft_thread_create (sched2,traceInstants,NULL,&i2); 
  
  th1 = ft_thread_create (sched1,f1,NULL,NULL);
  th2 = ft_thread_create (sched2,f2,NULL,NULL);

  ft_scheduler_start (sched1);
  ft_scheduler_start (sched2);  

  ft_exit ();
  return 0;
}

/* result
exit at instant (sched1: 1, sched2: 11)
end result */
