#include "fthread.h"
#include <stdio.h>

/* NEXT produced at next instant when no value is available */

void f (void *args)
{
   int i,res;
   int v, *cell = &v;
   for (i=0;;i++) {
      if (ENEXT == (res = ft_thread_get_value((ft_event_t)args,i,(void**)&cell))) {
	 fprintf (stdout,"next instant ");
	 break;
      }else fprintf (stdout,"get: %d\n",res);
   }
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
  ft_scheduler_t sched1 = ft_scheduler_create ();
  ft_thread_t th1;
  ft_event_t evt = ft_event_create (sched1);
  
  ft_thread_create (sched1,traceInstants,NULL,NULL);  

  th1 = ft_thread_create(sched1,f,NULL,evt);

  ft_scheduler_start (sched1);

  ft_exit ();
  return 0;
}

/* result
 
>>>>>>>>>>> instant 0:
>>>>>>>>>>> instant 1: next instant exit
end result */
