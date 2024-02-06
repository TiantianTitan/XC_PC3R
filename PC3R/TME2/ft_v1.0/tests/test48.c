#include "fthread.h"
#include "stdio.h"

/* only one thread which waits for a future instant */

void waiter (void *id)
{
   ft_thread_cooperate_n (10);
   fprintf (stdout,"exit!\n");
   exit (0);
}

int main(void)
{
  ft_scheduler_t sched = ft_scheduler_create();

  ft_thread_create(sched,waiter,NULL,NULL);

  ft_scheduler_start(sched);

  ft_exit();
  return 0;
}

/* result
exit! 
end result */
