#include "fthread.h"
#include <stdio.h>

ft_event_t event;

DEFINE_AUTOMATON (autom)
{
   BEGIN_AUTOMATON
      
      STATE_AWAIT_N(0,event,2)
      {
         if (RETURN_CODE == ETIMEOUT) fprintf (stdout, "timeout! ");
         else if (RETURN_CODE == OK) fprintf (stdout, "received! ");	 
	 GOTO (0);
      }
   
   END_AUTOMATON
}

DEFINE_AUTOMATON (gen)
{
  BEGIN_AUTOMATON
     STATE_STAY(0,2)
     {
         ft_thread_generate (event);
	 fprintf (stdout, "generate! ");
	 IMMEDIATE (0);
     }
  END_AUTOMATON
}

/*********************************/

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

   event = ft_event_create (sched);
   
   ft_thread_create (sched,traceInstants,NULL,NULL);  

   if (NULL == ft_automaton_create (sched,autom,NULL,NULL)) {
      fprintf (stdout, "cannot create automaton!!!\n");
   }
   ft_automaton_create (sched,gen,NULL,NULL);
   
   ft_scheduler_start (sched);

   ft_exit ();
   return 0;
}

/* result
 
>>>>>>>>>>> instant 0:
>>>>>>>>>>> instant 1:
>>>>>>>>>>> instant 2: timeout! generate!
>>>>>>>>>>> instant 3:
>>>>>>>>>>> instant 4: generate! received!
>>>>>>>>>>> instant 5:
>>>>>>>>>>> instant 6: generate! received!
>>>>>>>>>>> instant 7:
>>>>>>>>>>> instant 8: generate! received!
>>>>>>>>>>> instant 9: exit!
end result */
