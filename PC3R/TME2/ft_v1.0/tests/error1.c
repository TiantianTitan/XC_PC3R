#include "fthread.h"
#include <stdio.h>
#include <unistd.h>

/* stop an unlinked thread */

void cleanup (void *args)
{
   fprintf (stdout,"cleanup!!!!\n");
   exit (0);
}

void f (void *args)
{
   ft_thread_unlink();
   fprintf (stdout,"start sleeping\n");
   sleep (1);
   fprintf (stdout,"end of sleep\n");
   exit (0);
}

void stopThread (void *args)
{
  ft_thread_cooperate_n (1000);
  fprintf (stdout,"stop thread\n");
  
  if (OK != ft_scheduler_stop ((ft_thread_t)args)){
    fprintf (stdout,"cannot stop an unlinked thread\n");
  }else fprintf (stdout,"stop succeeded\n");

  exit (0);
}

int main (void)
{
  ft_scheduler_t sched =  ft_scheduler_create ();
  ft_thread_t th1 = ft_thread_create (sched,f,cleanup,NULL);
  
  ft_thread_create (sched,stopThread,NULL,th1);

  ft_scheduler_start (sched);
sleep(10);
  fprintf (stdout,"exit\n");
  ft_exit();
  return 0;
}

/* result
start sleeping
stop thread
cannot stop an unlinked thread
end result */
