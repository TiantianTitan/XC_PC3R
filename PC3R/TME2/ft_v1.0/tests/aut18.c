#include "fthread.h"
#include "stdio.h"

/* SELECT */

ft_event_t  a,b;

DEFINE_AUTOMATON(awaiter)
{
   ft_event_t events [2] = {a,b};
   int        result [2] = {0,0};

   BEGIN_AUTOMATON
      
      STATE_SELECT(0,2,events,result)
      {
	 fprintf (stdout, "result: [%d,%d] ",result[0],result[1]);
	 GOTO_NEXT;
      }
   
      STATE(1)
      {
         fprintf (stdout, "exit!\n");
	 fflush (stdout);
         exit (0);
      }

   END_AUTOMATON
}

DEFINE_AUTOMATON(generator)
{
   BEGIN_AUTOMATON
      STATE_STAY(0,5)
      {
	 ft_thread_generate ((ft_event_t)ARGS);
      }
   END_AUTOMATON   
}

/**************************************************/
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

   ft_automaton_create (sched,awaiter,NULL,NULL);
   ft_automaton_create (sched,generator,NULL,b);   
   ft_automaton_create (sched,generator,NULL,a);   

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
instant 6: result: [1,1]
instant 7: exit!
end result */
