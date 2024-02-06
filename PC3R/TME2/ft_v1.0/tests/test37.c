#include "fthread.h"
#include "stdio.h"
#include <stdlib.h>

/* awaiting 0 times */
ft_event_t evt;
ft_thread_t th;

void awaiter (void *args)
{
   ft_thread_await_n (evt,0);
   fprintf (stdout, "timeout!\n");   
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

  evt = ft_event_create (sched);

  ft_thread_create (sched,trace_instant,NULL,NULL);

  ft_thread_create (sched,awaiter,NULL,NULL);     

  ft_scheduler_start (sched);

  ft_exit ();
  return 0;
}

/* result
 
instant 1: timeout!
end result */
