#include "fthread.h"
#include "stdio.h"
#include <stdlib.h>

/* stop a thread awaiting an event */
ft_event_t evt;
ft_thread_t th;

void killer (void *args)
{
   ft_thread_cooperate_n (10);
   fprintf (stdout, "stop!\n");   
   ft_scheduler_stop (th);

   ft_thread_cooperate_n (10);
   fprintf (stdout, "generate!\n");   
   ft_thread_generate (evt);   

   ft_thread_cooperate_n (10);
   fprintf (stdout, "exit!\n");
   exit (0);
}


void waiter (void *args)
{
   ft_thread_await (evt);
   fprintf (stdout, "received!\n");
}

int main (void)
{
  ft_scheduler_t sched = ft_scheduler_create ();

  evt = ft_event_create (sched);
  th = ft_thread_create (sched,waiter,NULL,NULL);     
  ft_thread_create (sched,killer,NULL,NULL);

  ft_scheduler_start (sched);

  ft_exit ();
  return 0;
}

/* result
stop!
generate!
exit!
end result */
