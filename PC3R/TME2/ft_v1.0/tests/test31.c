#include "fthread.h"
#include "stdio.h"

/* cleanup executed only when the stopped thread was not finished */

void behav (void *args)
{
   ft_thread_cooperate_n (3);
   fprintf (stdout,"thread finished: no cleanup should appear\n");
}


void run (void *args)
{
   ft_thread_cooperate_n (3);
   ft_scheduler_stop ((ft_thread_t)args);
   ft_thread_cooperate_n (6);
   fprintf (stdout,"exit\n");
   exit (0);  
}

void cleanup (void *args)
{
   fprintf (stdout,"clean up!!!!!!!!\n");   
}

int main(void)
{
  ft_thread_t ft1;
  ft_scheduler_t sched = ft_scheduler_create ();

  ft1 = ft_thread_create (sched,behav,cleanup,NULL);  
  ft_thread_create (sched,run,NULL,(void*)ft1);

  ft_scheduler_start (sched);

  ft_exit ();
  return 0;
}

/* result
thread finished: no cleanup should appear
exit
end result */
