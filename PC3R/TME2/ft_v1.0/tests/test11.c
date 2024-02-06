#include "fthread.h"
#include <stdio.h>
#include <unistd.h>

/* mutual stops */

void run (void *args)
{
   ft_thread_t *t = (ft_thread_t*)args;
   ft_thread_cooperate_n (3);
   ft_scheduler_stop (*t);
   fprintf (stdout,"stopping a thread\n");
   
   while (1) ft_thread_cooperate ();
}

void cleanup (void *args)
{
   sleep (1);
   fprintf (stdout,"2 clean up should appear!!!!!!!!\n");
   fflush (stdout);
}

void traceInstants (void *args)
{
   int i = 0;
   while (1) {
      fprintf (stdout,"\n>>>>>>>>>>> instant %d ",i++);
      ft_thread_cooperate ();
   }
}


int main (void)
{
  int c, *cell = &c;
  ft_scheduler_t sched = ft_scheduler_create ();
  ft_thread_t ft0, ft1;

  //ft_thread_create (sched,traceInstants,NULL,NULL);  

  ft0 = ft_thread_create (sched,run,cleanup,(void*)&ft1);
  ft1 = ft_thread_create (sched,run,cleanup,(void*)&ft0);
  
  ft_scheduler_start (sched);

  pthread_join (ft_pthread (ft0),(void**)&cell);
  pthread_join (ft_pthread (ft1),(void**)&cell);  
  fprintf (stdout,"exit\n");
  exit (0);

  return 0;
}

/* result
stopping a thread
stopping a thread
2 clean up should appear!!!!!!!!
2 clean up should appear!!!!!!!!
exit
end result */
