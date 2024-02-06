#include "fthread.h"
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>

/* awaiting 2 events using two auxiliary automata */

ft_event_t e1,e2;

/*************************************/
void awaiter_cleanup (void *args)
{
   fprintf (stdout, "awaiter is killed! ");
}

DEFINE_AUTOMATON(awaiter)
{
   void **args = ARGS;
   ft_event_t event   = (ft_event_t) (args[0]);
   ft_event_t present = (ft_event_t) (args[1]);
   
  BEGIN_AUTOMATON
     
     STATE_AWAIT(0,event)
     {
        ft_thread_generate (present);
	GOTO(0);
     }
  
  END_AUTOMATON
}

DEFINE_AUTOMATON(both)
{
   void **args = ARGS;
   
   ft_scheduler_t sched  = (ft_scheduler_t)args[0];
   ft_event_t     event1 = (ft_event_t)    args[1];
   ft_event_t     event2 = (ft_event_t)    args[2];
   
  BEGIN_AUTOMATON
     
     STATE(0)
     {
        void **v1 = malloc (2), **v2 = malloc (2);
        ft_event_t present = ft_event_create (sched);

        v1[0] = event1;
        v1[1] = present;
        ft_automaton_create (sched,awaiter,awaiter_cleanup,v1);

	v2[0] = event2;
        v2[1] = present;
        ft_automaton_create (sched,awaiter,awaiter_cleanup,v2);
	SET_LOCAL (present);
     }
  
     STATE_AWAIT(1,(ft_event_t)LOCAL)
     {
        fprintf (stdout, "event received! ");
	GOTO(1);
     }
     
  END_AUTOMATON
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
   int i;
   for (i=0;i<3;i++) {
      ft_thread_cooperate_n (3);
      ft_thread_generate (e1);
      fprintf (stdout, "e1 generated! ");
      ft_thread_cooperate_n (1);   
      ft_thread_generate (e2);
      fprintf (stdout, "e2 generated! ");
   }
}

int main(void)
{
   void **v = malloc (3);
   ft_scheduler_t sched = ft_scheduler_create ();
   e1 = ft_event_create (sched);
   e2 = ft_event_create (sched);

   ft_thread_create (sched,traceInstants,NULL,NULL);
   ft_thread_create (sched,generator,NULL,NULL); 

   v[0] = sched;
   v[1] = e1;
   v[2] = e2;
   ft_automaton_create (sched,both,NULL,v);   

   ft_scheduler_start (sched);   
   
   ft_exit ();
   return 0;
}

/* result
 
>>>>>>>>>>> instant 0:
>>>>>>>>>>> instant 1:
>>>>>>>>>>> instant 2:
>>>>>>>>>>> instant 3: e1 generated! event received!
>>>>>>>>>>> instant 4: e2 generated! event received!
>>>>>>>>>>> instant 5:
>>>>>>>>>>> instant 6:
>>>>>>>>>>> instant 7: e1 generated! event received!
>>>>>>>>>>> instant 8: e2 generated! event received!
>>>>>>>>>>> instant 9:
>>>>>>>>>>> instant 10:
>>>>>>>>>>> instant 11: e1 generated! event received!
>>>>>>>>>>> instant 12: e2 generated! event received!
>>>>>>>>>>> instant 13:
>>>>>>>>>>> instant 14:
>>>>>>>>>>> instant 15:
>>>>>>>>>>> instant 16:
>>>>>>>>>>> instant 17:
>>>>>>>>>>> instant 18:
>>>>>>>>>>> instant 19: exit! 
end result */

