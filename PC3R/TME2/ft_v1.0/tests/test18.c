#include "fthread.h"
#include "stdio.h"
#include <unistd.h>

/* join an unlinked thread */

ft_thread_t ft0;

/********************************************/
void behav (void *text)
{
   ft_thread_unlink ();
   usleep (1);
   fprintf (stdout,"sleep finished\n");
}

void control (void *args)
{
   fprintf (stdout,"try to join\n");
   ft_thread_join (ft0);
   fprintf (stdout,"exit\n");
   exit (0);
}

void empty (void *args)
{
   while (1) ft_thread_cooperate ();
}

/********************************************/
int main (void)
{
  ft_scheduler_t sched = ft_scheduler_create ();

  ft_thread_create (sched,control,NULL,NULL);
  ft0 = ft_thread_create (sched,behav,NULL,NULL);

  ft_thread_create (sched,empty,NULL,NULL);

  ft_scheduler_start (sched);

  ft_exit ();
  return 0;
}

/* result
try to join
sleep finished
exit
end result */
