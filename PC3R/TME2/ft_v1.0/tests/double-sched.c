#include "fthread.h"
#include <stdio.h>

ft_scheduler_t slow,fast;
ft_event_t sync_slow,sync_fast;
ft_thread_t slow_th,fast_th;

/**********************************/
void behav (int n,void* args){
  ft_event_t evt = (ft_event_t)args;

  while(1){
    ft_thread_await(evt);
    fprintf (stderr,"%d",n);
    ft_thread_cooperate ();
  }
}

void behav0 (void* args){
   behav (0,args);
}

void behav1 (void* args){
   behav (1,args);
}

/**********************************/
void fast_pilot (void *args)
{
   while (1) {
    ft_thread_generate (sync_fast);
    ft_thread_cooperate_n (10);
  }  
}

void slow_pilot (void *args)
{
   while (1) {
      ft_thread_generate (sync_slow);
      ft_thread_cooperate_n (100);
   }  
}

void counter (void *args)
{
   int i;
   for (i=0;i<10000;i++) {
      ft_thread_cooperate ();
   }
   fprintf (stdout,"the output is not deterministic\n");
   fprintf (stderr,"\n");
   exit (0);
}

/**********************************/
int main (void)
{
  slow = ft_scheduler_create ();
  fast = ft_scheduler_create ();
  
  sync_fast = ft_event_create (fast);
  sync_slow = ft_event_create (slow);  
  
  fast_th = ft_thread_create (fast,fast_pilot,NULL,NULL);
  slow_th = ft_thread_create (slow,slow_pilot,NULL,NULL);

  ft_thread_create (slow,behav1,NULL,sync_slow);
  ft_thread_create (fast,behav0,NULL,sync_fast);

  ft_thread_create (slow,counter,NULL,NULL);


  ft_scheduler_start (fast);
  ft_scheduler_start (slow);  

  ft_exit();
  return 0;
}

/* result
the output is not deterministic
end result */
