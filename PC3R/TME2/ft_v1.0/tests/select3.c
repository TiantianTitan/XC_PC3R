#include "fthread.h"
#include "stdio.h"

/* use of select_n to react to the absence of an event */

ft_event_t  a;

void awaiter (void *args)
{
   ft_event_t events [1] = {a};
   int        result [1] = {0};
   
   ft_thread_select_n (1,events,result,1);
   fprintf (stdout, "result: [%d] ",result[0]);
   if (result[0] == 1) fprintf (stdout, "a is present! ");
   else fprintf (stdout, "a was absent! ");

   ft_thread_cooperate ();

   ft_thread_select_n (1,events,result,1);
   fprintf (stdout, "result: [%d] ",result[0]);
   if (result[0] == 1) fprintf (stdout, "a is present! ");
   else fprintf (stdout, "a was absent! ");

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
   fprintf (stdout, "event a generated! ");
   ft_thread_generate (a);
}

int main (void)
{
   ft_scheduler_t sched = ft_scheduler_create ();

   a = ft_event_create (sched);
   ft_thread_create (sched,trace_instant,NULL,NULL);

   ft_thread_create (sched,agenerator,NULL,NULL);
   ft_thread_create (sched,awaiter,NULL,NULL);

   ft_scheduler_start (sched);

   ft_exit ();
   return 0;
}

/* result
 
instant 1: event a generated! result: [1] a is present!
instant 2:
instant 3: result: [0] a was absent!
instant 4: exit!
end result */
