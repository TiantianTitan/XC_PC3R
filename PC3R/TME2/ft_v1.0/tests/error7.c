#include "fthread.h"
#include <stdio.h>
#include <unistd.h>

/* join with different schedulers */

void f (void *args)
{
   ft_thread_cooperate_n (100);
}

void g (void *args)
{
   if (OK != ft_thread_join ((ft_thread_t)args)) {
      fprintf (stdout,"cannot join a thread run by a distinct scheduler\n");
   }else fprintf (stdout,"CAN join a thread run by a distinct scheduler\n");
   exit (0);
}

int main (void)
{
  ft_scheduler_t sched1 = ft_scheduler_create (),
     sched2 = ft_scheduler_create ();

  ft_thread_t th1 = ft_thread_create(sched1,f,NULL,sched2);
  ft_thread_create(sched2,g,NULL,th1);  

sleep(1);
 
  ft_scheduler_start(sched1);
  ft_scheduler_start(sched2);  

  ft_exit ();
  return 0;
}

/* result
CAN join a thread run by a distinct scheduler 
end result */
