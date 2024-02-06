#include "fthread.h"
#include <stdio.h>
#include <unistd.h>

/* automata can be suspended and resumed, just as standard threads */

/*************************************/
ft_thread_t a;

/*************************************/
DEFINE_AUTOMATON(behav1)
{
  BEGIN_AUTOMATON
     
     STATE(0)
        fprintf (stdout,"* ");
        GOTO(0);

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

void waiter (void *args)
{
   while (1) {
      ft_thread_cooperate_n (3);
      ft_scheduler_suspend (a);

      ft_thread_cooperate_n (3);
      ft_scheduler_resume (a);
   }
}

int main(void)
{
   ft_scheduler_t sched = ft_scheduler_create ();

   ft_thread_create (sched,traceInstants,NULL,NULL);
   ft_thread_create (sched,waiter,NULL,NULL); 

   a = ft_automaton_create (sched,behav1,NULL,NULL);   

   ft_scheduler_start (sched);   
   
   ft_exit ();
   return 0;
}

/* result
 
>>>>>>>>>>> instant 0: *
>>>>>>>>>>> instant 1: *
>>>>>>>>>>> instant 2: *
>>>>>>>>>>> instant 3: *
>>>>>>>>>>> instant 4:
>>>>>>>>>>> instant 5:
>>>>>>>>>>> instant 6:
>>>>>>>>>>> instant 7: *
>>>>>>>>>>> instant 8: *
>>>>>>>>>>> instant 9: *
>>>>>>>>>>> instant 10:
>>>>>>>>>>> instant 11:
>>>>>>>>>>> instant 12:
>>>>>>>>>>> instant 13: *
>>>>>>>>>>> instant 14: *
>>>>>>>>>>> instant 15: *
>>>>>>>>>>> instant 16:
>>>>>>>>>>> instant 17:
>>>>>>>>>>> instant 18:
>>>>>>>>>>> instant 19: * exit!
end result */
