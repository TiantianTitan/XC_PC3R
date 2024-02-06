#include "fthread.h"
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>

/* JOIN  */

/*************************************/
DEFINE_AUTOMATON(joiner)
{
  BEGIN_AUTOMATON
     
     STATE_JOIN(0,(ft_thread_t)ARGS)
        fprintf (stdout, "thread joined!\n");

  END_AUTOMATON
}

/*************************************/
void printer (void *args)
{
   int i;
   for (i=0;i<10;i++) {
      fprintf (stdout, "*");
      ft_thread_cooperate ();
   }
   fprintf (stdout, "end of print! ");   
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

int main(void)
{
   ft_scheduler_t sched = ft_scheduler_create ();
   ft_thread_t pr,a1,a2,a3;  
 
   ft_thread_create (sched,traceInstants,NULL,NULL);
   pr = ft_thread_create (sched,printer,NULL,NULL); 

   a1 = ft_automaton_create (sched,joiner,NULL,pr);   
   a2 = ft_automaton_create (sched,joiner,NULL,a1);
   a3 = ft_automaton_create (sched,joiner,NULL,a2);   
 
   ft_scheduler_start (sched);   
   
   ft_exit ();
   return 0;
}

/* result
 
>>>>>>>>>>> instant 0: *
>>>>>>>>>>> instant 1: *
>>>>>>>>>>> instant 2: *
>>>>>>>>>>> instant 3: *
>>>>>>>>>>> instant 4: *
>>>>>>>>>>> instant 5: *
>>>>>>>>>>> instant 6: *
>>>>>>>>>>> instant 7: *
>>>>>>>>>>> instant 8: *
>>>>>>>>>>> instant 9: *
>>>>>>>>>>> instant 10: end of print! thread joined!
thread joined!
thread joined!
 
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
