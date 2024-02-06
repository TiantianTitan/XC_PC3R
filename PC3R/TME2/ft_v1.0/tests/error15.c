#include "fthread.h"
#include <stdio.h>

/* bad event creation */

void f (void *args)
{
   int v, *cell = &v;
   if (EBADCREATE == ft_thread_generate ((ft_event_t)args)) {
      fprintf (stdout,"bad event creation\n");
   }

   if (EBADCREATE == ft_thread_await ((ft_event_t)args)) {
      fprintf (stdout,"bad event creation\n");
   }   

   if (EBADCREATE == ft_thread_get_value ((ft_event_t)args,0,(void**)&cell)) {
      fprintf (stdout,"bad event creation\n");
   }

   exit (0);
}

int main (void)
{
  ft_scheduler_t sched1 = NULL;
  ft_event_t evt = NULL;

  sched1 = ft_scheduler_create ();

  //evt = ft_event_create (sched1);

  ft_thread_create (sched1,f,NULL,evt);

  ft_scheduler_start (sched1);

  ft_exit ();
  return 0;
}

/* result
bad event creation
bad event creation
bad event creation
end result */
