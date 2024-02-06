#include "fthread.h"
#include "stdio.h"

/* generate_value */

void run (void *args)
{
   int v, *cell = &v, **value = &cell;
   while (1){
      ft_thread_await ((ft_event_t)args);
      ft_thread_get_value ((ft_event_t)args,0,(void**)value);
      fprintf (stdout,"received %d! ",**value);
      ft_thread_cooperate ();
   }
}

void control (void *args)
{
   int value;
   ft_thread_cooperate_n (2);

   value = 12;
   fprintf (stdout,"generate %d ",value);   
   ft_thread_generate_value ((ft_event_t)args,(void*)&value);

   ft_thread_cooperate_n (2);

   value = 22;
   fprintf (stdout,"generate %d ",value);   
   ft_thread_generate_value ((ft_event_t)args,(void*)&value);

   ft_thread_cooperate_n (2);

   value = 32;
   fprintf (stdout,"generate %d ",value);   
   ft_thread_generate_value ((ft_event_t)args,(void*)&value);

   ft_thread_cooperate_n (2);   
   fprintf (stdout,"exit\n");   
   exit (0);
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
  ft_event_t go = ft_event_create (sched);

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
>>>>>>>>>>> instant 2: generate 12 received 12!
>>>>>>>>>>> instant 3:
>>>>>>>>>>> instant 4: generate 22 received 22!
>>>>>>>>>>> instant 5:
>>>>>>>>>>> instant 6: generate 32 received 32!
>>>>>>>>>>> instant 7:
>>>>>>>>>>> instant 8: exit
end result */
