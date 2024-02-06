#include "fthread.h"
#include "stdio.h"

/* cleanup is also called when stopping a suspended thread */

void behav (void *args)
{
   while (1) {
      fprintf (stdout,"*");
      ft_thread_cooperate ();
   }
}

void run (void *args)
{
   ft_thread_t t = (ft_thread_t)args;

   ft_thread_cooperate_n (2);
   fprintf (stdout,"order to suspend thread\n");
   ft_scheduler_suspend (t);
   ft_thread_cooperate_n (3);
   fprintf (stdout,"order to stop thread\n");
   ft_scheduler_stop (t);
   ft_thread_cooperate_n (6);

   ft_thread_join (t);
   fprintf (stdout,"exit\n");
   exit (0);  
}

void cleanup (void *args)
{
   fprintf (stdout,"clean up!!!!!!!!\n");
   fflush (stdout);
}

void traceInstants (void *args)
{
   int i = 0;
   while (1) {
      fprintf(stdout,"\n>>>>>>>>>>> instant %d: ",i++);
      fflush (stdout);
      ft_thread_cooperate ();
   }
      
}

/*******************************/
int main (void)
{
  ft_thread_t ft1;

  ft_scheduler_t sched = ft_scheduler_create ();

  ft1 = ft_thread_create (sched,behav,cleanup,NULL);
  ft_thread_create (sched,run,NULL,(void*)ft1);

  //ft_thread_create (sched,traceInstants,NULL,NULL);  

  ft_scheduler_start (sched);

  ft_exit ();
  return 0;
}

/* result
***order to suspend thread
order to stop thread
clean up!!!!!!!!
exit
end result */
