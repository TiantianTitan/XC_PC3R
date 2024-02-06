#include "fthread.h"
#include "stdio.h"

/* use of select to await 2 events */

ft_event_t  a,b;

void awaiter (void *args)
{
   ft_event_t events [2] = {a,b};
   int        result [2] = {0,0};
   
   ft_thread_select (2,events,result);
   fprintf (stdout, "result: [%d,%d] ",result[0],result[1]);
   if (result[0] == 0 || result[1] == 0) {
      ft_thread_await (result[0]==0 ? events[0] : events[1]); 
   }

   fprintf (stdout, "both received! ");
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

void agenerator (void *args)
{
   ft_thread_cooperate_n (3);  
   fprintf (stdout, "event a generated! ");
   ft_thread_generate (a);
}

void bgenerator (void *args)
{
   ft_thread_cooperate_n (3);  
   fprintf (stdout, "event b generated! ");
   ft_thread_generate (b);
}

int main (void)
{
   ft_scheduler_t sched = ft_scheduler_create ();

   a = ft_event_create (sched);
   b = ft_event_create (sched);
   ft_thread_create (sched,trace_instant,NULL,NULL);

   ft_thread_create (sched,agenerator,NULL,NULL);     
   ft_thread_create (sched,awaiter,NULL,NULL);
   ft_thread_create (sched,bgenerator,NULL,NULL);

   ft_scheduler_start (sched);

   ft_exit ();
   return 0;
}

/* result
 
instant 1:
instant 2:
instant 3:
instant 4: event a generated! result: [1,0] event b generated! both received!
instant 5: exit!
end result */
