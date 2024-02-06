#include "fthread.h"
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>

/*  */

ft_event_t event;
/*************************************/
DEFINE_AUTOMATON(autom_behav)
{
  BEGIN_AUTOMATON
     
     STATE_AWAIT_N(0,(ft_event_t)ARGS,15)
     {
        fprintf (stdout, "exit!\n");
	exit(0);
     }

   END_AUTOMATON
}

/*************************************/
void controler (void *args)
{
   ft_thread_t autom = (ft_thread_t)args;
   ft_thread_cooperate_n (3);
   fprintf (stdout, "suspend autom! ");
   ft_scheduler_suspend (autom);
   ft_thread_cooperate_n (3);
   fprintf (stdout, "generate event! ");
   ft_thread_generate (event);
   ft_thread_cooperate_n (3);   
   fprintf (stdout, "resume autom! ");
   ft_scheduler_resume (autom);   
}

/*************************************/
void traceInstants (void *args)
{
   int i = 0;
   for (i=0;i<20;i++) {
      fprintf(stdout,"\n>>>>>>>>>>> instant %d: ",i);
      ft_thread_cooperate ();
   }
}

int main(void)
{
   ft_thread_t autom;
   ft_scheduler_t sched = ft_scheduler_create ();
   
   event = ft_event_create (sched);  

   autom = ft_automaton_create (sched,autom_behav,NULL,event);   
  
   ft_thread_create (sched,traceInstants,NULL,NULL);
   
   ft_thread_create (sched,controler,NULL,autom); 
   
   ft_scheduler_start (sched);
   
   ft_exit ();
   return 0;
}


/* result
 
>>>>>>>>>>> instant 0:
>>>>>>>>>>> instant 1:
>>>>>>>>>>> instant 2:
>>>>>>>>>>> instant 3: suspend autom!
>>>>>>>>>>> instant 4:
>>>>>>>>>>> instant 5:
>>>>>>>>>>> instant 6: generate event!
>>>>>>>>>>> instant 7:
>>>>>>>>>>> instant 8:
>>>>>>>>>>> instant 9: resume autom!
>>>>>>>>>>> instant 10:
>>>>>>>>>>> instant 11:
>>>>>>>>>>> instant 12:
>>>>>>>>>>> instant 13:
>>>>>>>>>>> instant 14: exit! 
end result */

