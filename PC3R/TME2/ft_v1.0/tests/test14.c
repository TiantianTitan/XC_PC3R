#include "fthread.h"
#include "stdio.h"

/* broadcast */

void run (void *args)
{
   while (1) {
      ft_thread_await ((ft_event_t)args);
      fprintf (stdout,"received! ");
      ft_thread_cooperate ();
   }
}

void control (void *args)
{
   ft_thread_cooperate_n (3);
   fprintf (stdout,"generate ");   
   ft_thread_generate ((ft_event_t)args);
   ft_thread_cooperate_n (3);
   fprintf (stdout,"broadcast ");   
   ft_scheduler_broadcast ((ft_event_t)args);   
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
  ft_scheduler_t sched = ft_scheduler_create();
  ft_event_t go = ft_event_create(sched);
  if (go == NULL) {
    fprintf (stderr, "error!!!!\n"); exit (-1);
  }

  ft_thread_create (sched,traceInstants,NULL,NULL);  
  ft_thread_create (sched,run,NULL,(void*)go);
  ft_thread_create (sched,control,NULL,(void*)go);

  ft_scheduler_start (sched);

  ft_exit ();
  return 0;
}

/* result
 
>>>>>>>>>>> instant 0:
>>>>>>>>>>> instant 1:
>>>>>>>>>>> instant 2:
>>>>>>>>>>> instant 3: generate received!
>>>>>>>>>>> instant 4:
>>>>>>>>>>> instant 5:
>>>>>>>>>>> instant 6: broadcast
>>>>>>>>>>> instant 7: received!
>>>>>>>>>>> instant 8:
>>>>>>>>>>> instant 9: exit 
end result */
