#include "fthread.h"
#include "stdio.h"

/* join with an unlinked thread executing ft_exit */

void exiting (void *args)
{
   ft_thread_cooperate_n (10);
   ft_thread_unlink ();
   fprintf (stdout, "running\n");   
   ft_exit ();
   fprintf (stdout, "should not appear!!!!!\n");   
}

void await_join (void* args)
{
   ft_thread_join ((ft_thread_t)args);
   fprintf (stdout, "exit\n");
   exit (0);
}

int main (void)
{
  ft_thread_t ft1;
  ft_scheduler_t sched = ft_scheduler_create();

  ft1 = ft_thread_create (sched,exiting,NULL,NULL);
  ft_thread_create (sched,await_join,NULL,(void*)ft1);

  ft_scheduler_start (sched);

  ft_exit ();
  return 0;
}

/* result
running 
exit
end result */
