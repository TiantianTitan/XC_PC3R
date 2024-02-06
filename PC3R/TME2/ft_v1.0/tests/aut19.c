#include "fthread.h"
#include "stdio.h"

/* SELECT_N */

ft_event_t  a,b;

DEFINE_AUTOMATON(awaiter)
{
   ft_event_t events [2] = {a,b};
   int        result [2] = {0,0};

   BEGIN_AUTOMATON
      
      STATE_SELECT_N(0,2,events,result,5)
      {
         if (RETURN_CODE == ETIMEOUT) fprintf (stdout, "timeout! ");
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
      STATE_STAY(0,3)
      {
         fprintf (stdout,"generate! ");
	 ft_thread_generate ((ft_event_t)ARGS);
      }
   END_AUTOMATON   
}

/**************************************************/
void trace_instant (void *args)
{
   int i = 1;
   for (i=0;;i++) {
      fprintf (stdout, "\ninstant %d: ",i);
      ft_thread_cooperate ();
   }
   fflush (stdout);
   exit(0);
}

int main (void)
{
   ft_scheduler_t sched = ft_scheduler_create ();

   a = ft_event_create (sched);
   b = ft_event_create (sched);
   ft_thread_create (sched,trace_instant,NULL,NULL);

   ft_automaton_create (sched,awaiter,NULL,NULL);
   //ft_automaton_create (sched,generator,NULL,b);   
   //ft_automaton_create (sched,generator,NULL,a);   

   ft_scheduler_start (sched);

   ft_exit ();
   return 0; 
}


/* result
 
instant 0:
instant 1:
instant 2:
instant 3:
instant 4:
instant 5: timeout! result: [0,0]
instant 6: exit!
end result */
