#include "fthread.h"
#include <stdio.h>

/* link in an already linked thread */

void f (void *args)
{
   if (OK != ft_thread_link ((ft_scheduler_t)args)) {
      fprintf (stdout,"cannot link an already linked thread\n");
   }
   exit(0);
}

int main(void)
{
  ft_scheduler_t sched1 = ft_scheduler_create (),
     sched2 = ft_scheduler_create ();

  ft_thread_create (sched1,f,NULL,sched2);

  ft_scheduler_start (sched1);
  ft_scheduler_start (sched2);  

  ft_exit ();
  return 0;
}

/* result
cannot link an already linked thread
end result */
