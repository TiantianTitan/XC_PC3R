#include "fthread.h"
#include "stdio.h"

/* generate_value */

void run (void *args)
{
   int v;
   int *c = &v;
   int **value = &c;
   while (1){
      int i,res;
      ft_thread_await ((ft_event_t)args);
      i=0;
      while (1){
	 res = ft_thread_get_value ((ft_event_t)args,i++,(void**)value);
	 if (res != 0) break;
	 fprintf (stdout,"received %d! ",**value);
      }
   }
}

void control (void *args)
{
   int v1,v2;
   ft_thread_cooperate_n (2);

   v1 = 12;
   fprintf (stdout,"generate %d ",v1);   
   ft_thread_generate_value ((ft_event_t)args,(void*)&v1);

   ft_thread_cooperate_n (1);

   v1 = 22;
   fprintf (stdout,"generate %d ",v1);   
   ft_thread_generate_value ((ft_event_t)args,(void*)&v1);

   v2 = 32;
   fprintf (stdout,"generate %d ",v2);   
   ft_thread_generate_value ((ft_event_t)args,(void*)&v2);

   ft_thread_cooperate_n (2);   
   fprintf (stdout,"exit\n");   
   exit (0);
}

void traceInstants (void *args)
{
   int i = 0;
   while (1){
      fprintf (stdout,"\n>>>>>>>>>>> instant %d: ",i++);
      ft_thread_cooperate ();
   }
}

int main(void)
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
>>>>>>>>>>> instant 3: generate 22 generate 32 received 22! received 32!
>>>>>>>>>>> instant 4:
>>>>>>>>>>> instant 5: exit
end result */
