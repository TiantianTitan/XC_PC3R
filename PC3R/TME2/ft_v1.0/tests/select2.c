#include "fthread.h"
#include "stdio.h"

/* use of select_n to limit the waiting */

ft_event_t  a,b;

void awaiter (void *args)
{
   ft_event_t events [2] = {a,b};
   int        result [2] = {0,0};
   
   ft_thread_select_n (2,events,result,10);
   fprintf (stdout, "result: [%d,%d] ",result[0],result[1]);
   ft_thread_cooperate ();
   fprintf (stdout, "exit!\n");
   exit (0);
}

void trace_instant (void *args)
{
   int i = 1;
   while (1) {
      fprintf (stdout, "\ninstant %d: ",i);
      i++;
      ft_thread_cooperate ();
   }
}

int main (void)
{
   ft_scheduler_t sched = ft_scheduler_create ();

   a = ft_event_create (sched);
   b = ft_event_create (sched);
   ft_thread_create (sched,trace_instant,NULL,NULL);

   ft_thread_create (sched,awaiter,NULL,NULL);

   ft_scheduler_start (sched);

   ft_exit ();
   return 0;
}

/* result
 
instant 1:
instant 2:
instant 3:
instant 4:
instant 5:
instant 6:
instant 7:
instant 8:
instant 9:
instant 10:
instant 11: result: [0,0]
instant 12: exit!
end result */
