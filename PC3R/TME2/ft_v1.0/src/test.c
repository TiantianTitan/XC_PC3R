#include "fthread.h"
#include <stdio.h>



/*********************************/
void traceInstants (void *args)
{
   int i = 0;
   for (i=0;i<1000000;i++) {
      //fprintf(stdout,"\n>>>>>>>>>>> instant %d: ",i);
      ft_thread_cooperate ();
   }
   fprintf (stdout, "exit!\n");
   exit (0);
}

int main ()
{
   int i;
   ft_scheduler_t sched = ft_scheduler_create ();

   for (i=0;i<1000;i++){
      ft_event_t event = ft_event_create (sched);
      ft_scheduler_broadcast (event);
   }
   
   ft_thread_create (sched,traceInstants,NULL,NULL);  

   ft_scheduler_start (sched);

   ft_exit ();
   return 0;
}

/* result
 
end result */
