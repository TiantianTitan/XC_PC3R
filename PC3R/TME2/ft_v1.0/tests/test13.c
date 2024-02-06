#include "fthread.h"
#include "stdio.h"

/* simultaneous suspend/resume; suspend has higher priority */

void run (void *args)
{
   while (1) {
      fprintf (stdout,"%s",(char*)args);
      ft_thread_cooperate ();
   }
}

void control (void *args)
{
   ft_thread_cooperate_n (3);
   fprintf (stdout,"suspend ");
   ft_scheduler_suspend ((ft_thread_t)args);
   fprintf (stdout,"resume ");   
   ft_scheduler_resume ((ft_thread_t)args);
   ft_thread_cooperate_n (3);
   fprintf (stdout,"exit\n");   
   exit(0);
}

void traceInstants (void *args)
{
   int i = 0;
   while (1) {
      fprintf (stdout,"\n>>>>>>>>>>> instant %d: ",i++);
      ft_thread_cooperate ();
   }
      
}

int main (void)
{
  ft_scheduler_t sched = ft_scheduler_create ();
  ft_thread_t ft0;

  ft_thread_create (sched,traceInstants,NULL,NULL);  
  ft0 = ft_thread_create (sched,run,NULL,(void*)"*");
  ft_thread_create (sched,control,NULL,(void*)ft0);

  ft_scheduler_start (sched);

  ft_exit ();
  return 0;
}

/* result
 
>>>>>>>>>>> instant 0: *
>>>>>>>>>>> instant 1: *
>>>>>>>>>>> instant 2: *
>>>>>>>>>>> instant 3: *suspend resume
>>>>>>>>>>> instant 4:
>>>>>>>>>>> instant 5:
>>>>>>>>>>> instant 6: exit
end result */
