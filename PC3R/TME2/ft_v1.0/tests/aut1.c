#include "fthread.h"
#include <stdio.h>

/* simultaneous events */

ft_event_t event1,event2;

DEFINE_AUTOMATON (autom)
{
   BEGIN_AUTOMATON
      STATE_AWAIT (0,event1);
      STATE_AWAIT (1,event2)  
      {
         fprintf (stdout, "both events are received! ");
      }
   END_AUTOMATON
}

/*********************************/
void generator (void *args)
{
   ft_thread_cooperate_n (4);
   fprintf (stdout, "event1 generated! ");
   ft_thread_generate (event1);

   ft_thread_cooperate_n (4);
   fprintf (stdout, "event1 and event2 are generated! ");
   ft_thread_generate (event1);
   ft_thread_generate (event2);
 
   ft_thread_cooperate ();
   fprintf (stdout, "exit\n");   
   exit (0);
}

void traceInstants (void *args)
{
   int i = 0;
   for (i=0;i<10;i++) {
      fprintf(stdout,"\n>>>>>>>>>>> instant %d: ",i);
      ft_thread_cooperate ();
   }
   fprintf (stdout, "exit!\n");
   exit (0);
}

int main ()
{
   ft_scheduler_t sched = ft_scheduler_create ();

   event1 = ft_event_create (sched);
   event2 = ft_event_create (sched);
   
   ft_thread_create (sched,traceInstants,NULL,NULL);  

   if (NULL == ft_automaton_create (sched,autom,NULL,NULL)) {
      fprintf (stdout, "cannot create automaton!!!\n");
   }
   ft_thread_create (sched,generator,NULL,NULL);      
   
   ft_scheduler_start (sched);

   ft_exit ();
   return 0;
}

/* result
 
>>>>>>>>>>> instant 0:
>>>>>>>>>>> instant 1:
>>>>>>>>>>> instant 2:
>>>>>>>>>>> instant 3:
>>>>>>>>>>> instant 4: event1 generated!
>>>>>>>>>>> instant 5:
>>>>>>>>>>> instant 6:
>>>>>>>>>>> instant 7:
>>>>>>>>>>> instant 8: event1 and event2 are generated! both events are received!
>>>>>>>>>>> instant 9: exit
end result */
