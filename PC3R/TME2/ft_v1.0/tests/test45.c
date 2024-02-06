#include "fthread.h"
#include "stdio.h"
#include <stdlib.h>

/*  */

#define CYCLES 1000000

void waiter (void *args)
{
   int i;
   i=0;
   fprintf (stdout, "start waiting\n");
   //for (i=0;i<CYCLES;i++) ft_thread_cooperate ();
   ft_thread_cooperate_n (CYCLES);
   fprintf (stdout, "end waiting\n");
   exit (0);
}

int main (void)
{
  ft_scheduler_t sched = ft_scheduler_create ();
     
  ft_thread_create (sched,waiter,NULL,NULL);
  //ft_thread_create (sched,waiter,NULL,NULL);

  ft_scheduler_start (sched);

  ft_exit ();
  return 0;
}

/* result
start waiting
end waiting
end result */
