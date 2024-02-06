#include "fthread.h"
#include "stdio.h"
#include <stdlib.h>

/* large number of threads waiting for events */

#define CYCLES 100000
#define EVENT_NUM 20 // must be less than the max number of threads in the system

void counter (void *args)
{
   int count = 0;
   int i;
   fprintf (stdout, "start counting\n");  
   for (i=0;i<CYCLES;i++) {
      count++;
      if (count%1000 == 0) fprintf (stdout, "*");
      ft_thread_cooperate ();
   }
   fprintf (stdout, "end counting\n");
   exit (0);
}

void waiter (void *args)
{
   ft_event_t event = (ft_event_t) args;
   ft_thread_await (event);
}

int main (void)
{
  int i;
  ft_scheduler_t sched = ft_scheduler_create ();

  for (i=0;i<EVENT_NUM;i++){
     ft_event_t evt = ft_event_create (sched);
     //fprintf (stdout, "new event %d\n",i);  
     ft_thread_create (sched,waiter,NULL,(void*)evt);     
  }

  ft_thread_create (sched,counter,NULL,NULL);

  ft_scheduler_start (sched);

  ft_exit ();
  return 0;
}

/* result
start counting
****************************************************************************************************end counting
end result */
