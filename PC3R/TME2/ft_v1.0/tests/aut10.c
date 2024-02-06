#include "fthread.h"
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>

/* preemption using an auxiliary automaton */

/*************************************/
ft_scheduler_t sched;

/*************************************/
DEFINE_AUTOMATON(killer)
{
   void **args = ARGS;
   ft_event_t event   = (ft_event_t)(args[0]);
   ft_thread_t thread = (ft_thread_t)(args[1]);
   
  BEGIN_AUTOMATON
     
     STATE_AWAIT(0,event)
        ft_scheduler_stop (thread);        
        fprintf (stdout, "stop thread!\n");
	
  END_AUTOMATON
}

/*************************************/
void printer (void *args)
{
   while (1) {
      fprintf (stdout, "*");
      ft_thread_cooperate ();
   }
}

void until (void *args)
{
   ft_event_t event = (ft_event_t) args;
   ft_thread_t pr = ft_thread_create (sched,printer,NULL,NULL);
   
   void **v = malloc (2);
   v[0] = event;
   v[1] = pr;
   
   ft_automaton_create (sched,killer,NULL,v);
}


/*************************************/
void traceInstants (void *args)
{
   int i = 0;
   for (i=0;i<20;i++) {
      fprintf(stdout,"\n>>>>>>>>>>> instant %d: ",i);
      ft_thread_cooperate ();
   }
   fprintf (stdout, "exit!\n");
   exit (0);
}

void generator (void *args)
{
   ft_thread_cooperate_n (10);
   ft_thread_generate ((ft_event_t)args);
   fprintf (stdout, "event generated! ");
}

int main(void)
{
   ft_event_t event;
   
   sched = ft_scheduler_create ();
   event = ft_event_create (sched);
   
   ft_thread_create (sched,traceInstants,NULL,NULL);
   ft_thread_create (sched,generator,NULL,event); 

   ft_thread_create (sched,until,NULL,event);   

   ft_scheduler_start (sched);   
   
   ft_exit ();
   return 0;
}

/* result
 
>>>>>>>>>>> instant 0:
>>>>>>>>>>> instant 1: *
>>>>>>>>>>> instant 2: *
>>>>>>>>>>> instant 3: *
>>>>>>>>>>> instant 4: *
>>>>>>>>>>> instant 5: *
>>>>>>>>>>> instant 6: *
>>>>>>>>>>> instant 7: *
>>>>>>>>>>> instant 8: *
>>>>>>>>>>> instant 9: *
>>>>>>>>>>> instant 10: event generated! *stop thread!
 
>>>>>>>>>>> instant 11:
>>>>>>>>>>> instant 12:
>>>>>>>>>>> instant 13:
>>>>>>>>>>> instant 14:
>>>>>>>>>>> instant 15:
>>>>>>>>>>> instant 16:
>>>>>>>>>>> instant 17:
>>>>>>>>>>> instant 18:
>>>>>>>>>>> instant 19: exit! 
end result */
