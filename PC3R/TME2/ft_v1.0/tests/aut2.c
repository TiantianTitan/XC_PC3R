#include "fthread.h"
#include <stdio.h>

/* timeout with AWAIT_N */

ft_event_t event;

DEFINE_AUTOMATON (autom)
{
 BEGIN_AUTOMATON
   STATE_AWAIT_N(0,event,2)
   {
      if (RETURN_CODE == ETIMEOUT) fprintf (stdout, "timeout! ");
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
   
   ft_scheduler_start (sched);

   ft_exit ();
   return 0;
}

/* result
 
>>>>>>>>>>> instant 0:
>>>>>>>>>>> instant 1:
>>>>>>>>>>> instant 2: timeout!
>>>>>>>>>>> instant 3:
>>>>>>>>>>> instant 4: timeout!
>>>>>>>>>>> instant 5:
>>>>>>>>>>> instant 6: timeout!
>>>>>>>>>>> instant 7:
>>>>>>>>>>> instant 8: timeout!
>>>>>>>>>>> instant 9: exit!
end result */
