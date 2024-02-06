#include "fthread.h"
#include <stdio.h>

/* get value of an event which is in a different scheduler */

void f (void *args)
{
   int v, *cell = &v;
   if (EBADLINK == ft_thread_generate ((ft_event_t)args)) {
      fprintf (stdout,"cannot generate event in another scheduler\n");
   }

   if (EBADLINK == ft_thread_get_value ((ft_event_t)args,0,(void**)&cell)) {
      fprintf (stdout,"cannot get value from another scheduler\n");
   }

   exit (0);
}

int main (void)
{
  ft_scheduler_t sched1 = ft_scheduler_create (),
     sched2 = ft_scheduler_create ();

  ft_event_t evt = ft_event_create (sched2);

  ft_thread_create (sched1,f,NULL,evt);

  ft_scheduler_start (sched1);
  ft_scheduler_start (sched2);  

  ft_exit ();
  return 0;
}

/* result
cannot generate event in another scheduler
cannot get value from another scheduler
end result */
