#include "fthread.h"
#include "stdio.h"
#include <stdlib.h>

/* cooperating 0 times */

ft_thread_t th;

void awaiter (void *args)
{
   ft_thread_cooperate_n (0);
   fprintf (stdout, "exit!\n");   
   exit (0);
}

int i = 1;
void trace_instant (void *args)
{
   while (1) {
      fprintf (stdout, "\ninstant %d: ",i);
      i++;
      ft_thread_cooperate ();
   }
}

int main (void)
{
  ft_scheduler_t sched = ft_scheduler_create ();

  ft_thread_create (sched,trace_instant,NULL,NULL);

  ft_thread_create (sched,awaiter,NULL,NULL);     

  ft_scheduler_start (sched);

  ft_exit ();
  return 0;
}

/* result
 
instant 1: exit!
end result */
