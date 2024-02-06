#include "fthread.h"
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>

/* two threads run in turn using an auxiliary automaton */

/*************************************/
DEFINE_AUTOMATON(switch_automaton)
{
   void **args = ARGS;
   
   ft_event_t   event   = (ft_event_t)   (args[0]);
   ft_thread_t  thread1 = (ft_thread_t)  (args[1]);
   ft_thread_t  thread2 = (ft_thread_t)  (args[2]);
   
  BEGIN_AUTOMATON
     
     STATE(0)
     {
	ft_scheduler_resume (thread1);
     }
     STATE_AWAIT (1,event)
     {
	ft_scheduler_suspend (thread1);
	ft_scheduler_resume  (thread2);
	GOTO(2);
     }
     STATE_AWAIT (2,event)
     {
	ft_scheduler_suspend (thread2);
	ft_scheduler_resume  (thread1);
	GOTO(1);
     }
     
  END_AUTOMATON
}

/*************************************/
void printer (void *args)
{
   while (1) {
      fprintf (stdout, "%s",(char*)args);
      ft_thread_cooperate ();
   }
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
   for (i=0;i<10;i++) {
      ft_thread_cooperate_n (5);
      ft_thread_generate ((ft_event_t)args);
      fprintf (stdout, "event generated! ");
   }
}

int main(void)
{
   ft_thread_t t1,t2;
   void **v = malloc (3);
   ft_scheduler_t sched = ft_scheduler_create ();
   ft_event_t event = ft_event_create (sched);

   ft_thread_create (sched,traceInstants,NULL,NULL);
   ft_thread_create (sched,generator,NULL,event);

   t1 = ft_thread_create (sched,printer,NULL,"1");
   t2 = ft_thread_create (sched,printer,NULL,"2");

   ft_scheduler_suspend (t1);
   ft_scheduler_suspend (t2);   

   v[0] = event;
   v[1] = t1;
   v[2] = t2;
   ft_automaton_create (sched,switch_automaton,NULL,v);   

   ft_scheduler_start (sched);   
   
   ft_exit ();
   return 0;
}

/* result
 
>>>>>>>>>>> instant 0:
>>>>>>>>>>> instant 1: 1
>>>>>>>>>>> instant 2: 1
>>>>>>>>>>> instant 3: 1
>>>>>>>>>>> instant 4: 1
>>>>>>>>>>> instant 5: event generated! 1
>>>>>>>>>>> instant 6: 2
>>>>>>>>>>> instant 7: 2
>>>>>>>>>>> instant 8: 2
>>>>>>>>>>> instant 9: 2
>>>>>>>>>>> instant 10: event generated! 2
>>>>>>>>>>> instant 11: 1
>>>>>>>>>>> instant 12: 1
>>>>>>>>>>> instant 13: 1
>>>>>>>>>>> instant 14: 1
>>>>>>>>>>> instant 15: event generated! 1
>>>>>>>>>>> instant 16: 2
>>>>>>>>>>> instant 17: 2
>>>>>>>>>>> instant 18: 2
>>>>>>>>>>> instant 19: 2exit! 
end result */

