#include "fthread.h"
#include "stdio.h"

/* a thread can be created before the scheduler */

int main (void)
{
  ft_scheduler_t sched = NULL;

  if (EBADCREATE == ft_scheduler_start (sched)){
     fprintf (stdout,"scheduler bad creation\n");
  }

  fprintf (stdout,"exit\n");

  exit (0);
  return 0;
}

/* result
scheduler bad creation
exit
end result */
