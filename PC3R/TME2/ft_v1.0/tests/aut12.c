#include "fthread.h"
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>

/* JOIN_N  */

/*************************************/
DEFINE_AUTOMATON(joiner)
{
  BEGIN_AUTOMATON
     
     STATE_JOIN_N(0,(ft_thread_t)ARGS,10)
        if (RETURN_CODE == ETIMEOUT) fprintf (stdout, "timeout!\n");
        else fprintf (stdout, "thread joined!\n");

     STATE(1)
        fprintf (stdout, "exit!\n");
	exit(0);

   END_AUTOMATON
}

/*************************************/
void printer (void *args)
{
   int i;
   for (i=0;i<30;i++) {
      fprintf (stdout, "*");
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
}

int main(void)
{
   ft_scheduler_t sched = ft_scheduler_create ();
   ft_thread_t pr;  
 
   ft_thread_create (sched,traceInstants,NULL,NULL);
   pr = ft_thread_create (sched,printer,NULL,NULL); 

   ft_automaton_create (sched,joiner,NULL,pr);   
 
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
>>>>>>>>>>> instant 10: *timeout!
exit! 
end result */
