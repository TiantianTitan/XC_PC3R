#include "fthread.h"
#include "stdio.h"
#include <stdlib.h>

/* efficiency of await_n implementation */

#define CYCLES 100000
#define NUMBER 100 // less than the max number of threads

void waiter (void *args)
{
   ft_thread_await_n ((ft_event_t)args,CYCLES);
   fprintf (stdout, "end waiting\n");
   exit (0);
}

int main (void)
{
  int i;
  ft_scheduler_t sched = ft_scheduler_create ();
     
  for (i=0;i<NUMBER;i++) {
     ft_thread_create (sched,waiter,NULL,(void*)ft_event_create (sched));
  }

  ft_scheduler_start (sched);
  fprintf (stdout, "start waiting\n");

  ft_exit ();
  return 0;
}

/* result
start waiting
end waiting
end result */
