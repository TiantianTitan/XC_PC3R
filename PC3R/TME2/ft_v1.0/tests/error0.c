#include "fthread.h"
#include "stdio.h"

/* cooperate not executed in a thread */

int main (void)
{
  ft_scheduler_t sched = ft_scheduler_create ();
  ft_scheduler_start (sched);  

  if (OK != ft_thread_cooperate ()) {
    fprintf (stdout,"cooperate not possible\n");
    exit (0);
  }

  ft_exit ();
  return 0;
}

/* result
cooperate not possible
end result */
