#include "fthread.h"
#include "stdio.h"

/* cleanup is also called when stopping a suspended thread */

ft_thread_t ft1,ft2;

void behav (void *args)
{
   while (1) {
      fprintf (stdout,"%s ",(char*)args);
      ft_thread_cooperate ();
   }
}

void killer (void *args)
{
   ft_thread_cooperate_n (10);
   fprintf (stdout,"stop ft1 ");
   ft_scheduler_stop (ft1);
   fprintf (stdout,"stop ft2 ");   
   ft_scheduler_stop (ft2);
   ft_thread_cooperate_n (10);   
   fprintf (stdout,"exit\n");
   exit (0);  
}

void cleanup (void *args)
{
   fprintf (stdout,"\nclean up of %s!!!!!!!!\n",(char*)args);
}

void traceInstants (void *args)
{
   int i = 0;
   while (1) {
      fprintf(stdout,"\n>>>>>>>>>>> instant %d: ",i++);
      fflush (stdout);
      ft_thread_cooperate ();
   }
      
}

/*******************************/
int main (void)
{

  ft_scheduler_t sched = ft_scheduler_create ();

  ft1 = ft_thread_create (sched,behav,cleanup,"1");
  ft2 = ft_thread_create (sched,behav,cleanup,"2");

  ft_thread_create (sched,killer,NULL,NULL);
  ft_thread_create (sched,traceInstants,NULL,NULL);  

  ft_scheduler_start (sched);

  ft_exit ();
  return 0;
}

/* result
1 2
>>>>>>>>>>> instant 0: 1 2
>>>>>>>>>>> instant 1: 1 2
>>>>>>>>>>> instant 2: 1 2
>>>>>>>>>>> instant 3: 1 2
>>>>>>>>>>> instant 4: 1 2
>>>>>>>>>>> instant 5: 1 2
>>>>>>>>>>> instant 6: 1 2
>>>>>>>>>>> instant 7: 1 2
>>>>>>>>>>> instant 8: 1 2
>>>>>>>>>>> instant 9: 1 2 stop ft1 stop ft2
>>>>>>>>>>> instant 10:
clean up of 1!!!!!!!!
 
clean up of 2!!!!!!!!
 
>>>>>>>>>>> instant 11:
>>>>>>>>>>> instant 12:
>>>>>>>>>>> instant 13:
>>>>>>>>>>> instant 14:
>>>>>>>>>>> instant 15:
>>>>>>>>>>> instant 16:
>>>>>>>>>>> instant 17:
>>>>>>>>>>> instant 18:
>>>>>>>>>>> instant 19: exit
end result */
