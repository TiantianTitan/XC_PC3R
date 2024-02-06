#include "fthread.h"
#include <stdio.h>

DEFINE_AUTOMATON (autom)
{
   ft_event_t event = (ft_event_t)ARGS;
   int c;
   
   BEGIN_AUTOMATON

      STATE_AWAIT (0,event)
      {
 	 fprintf (stdout, "received! ");
      }

      STATE_GET_VALUE (1,event,1,(void**)&c)
      {
         if (RETURN_CODE == ENEXT) fprintf (stdout, "no value #1 available! ");
         else if (RETURN_CODE == OK) fprintf (stdout, "get value #1 %d! ",c);	 
	 GOTO (0);
      }

   END_AUTOMATON
}      

void one_generation (ft_event_t event,ft_thread_t SELF)
{
   ft_thread_generate_value (event,(void*)LOCAL);
   fprintf (stdout, "generate %d! ",(int)LOCAL);
   SET_LOCAL (LOCAL+1);   
}

DEFINE_AUTOMATON (gen)
{
   ft_event_t event = (ft_event_t)ARGS;
   
   BEGIN_AUTOMATON
   STATE(0)
      {
         SET_LOCAL (45);
      }
      
   STATE_STAY(1,3)
      {
         one_generation (event,SELF);
      }
      
   STATE_STAY(2,3)
      {
         one_generation (event,SELF);
         one_generation (event,SELF);
	 IMMEDIATE (1);
      }
   END_AUTOMATON
}

/*********************************/

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

int main ()
{
   ft_scheduler_t sched = ft_scheduler_create ();

   ft_event_t event = ft_event_create (sched);
   
   ft_thread_create (sched,traceInstants,NULL,NULL);  

   ft_automaton_create (sched,autom,NULL,event);
   ft_automaton_create (sched,gen,NULL,event);
   
   ft_scheduler_start (sched);

   ft_exit ();
   return 0;
}

/* result
 
>>>>>>>>>>> instant 0:
>>>>>>>>>>> instant 1:
>>>>>>>>>>> instant 2:
>>>>>>>>>>> instant 3: generate 45! received!
>>>>>>>>>>> instant 4: no value #1 available!
>>>>>>>>>>> instant 5:
>>>>>>>>>>> instant 6: generate 46! generate 47! received! get value #1 47!
>>>>>>>>>>> instant 7:
>>>>>>>>>>> instant 8:
>>>>>>>>>>> instant 9: generate 48! received!
>>>>>>>>>>> instant 10: no value #1 available!
>>>>>>>>>>> instant 11:
>>>>>>>>>>> instant 12: generate 49! generate 50! received! get value #1 50!
>>>>>>>>>>> instant 13:
>>>>>>>>>>> instant 14:
>>>>>>>>>>> instant 15: generate 51! received!
>>>>>>>>>>> instant 16: no value #1 available!
>>>>>>>>>>> instant 17:
>>>>>>>>>>> instant 18: generate 52! generate 53! received! get value #1 53!
>>>>>>>>>>> instant 19: exit!
end result */
