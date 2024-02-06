#include "fthread.h"
#include "stdio.h"

/* scheduler must be created before being started */

int main(void)
{
  ft_scheduler_t sched = NULL;
  
  if (EBADCREATE == ft_scheduler_start (sched)){
     fprintf (stdout,"scheduler must be created before being started\n");
  }

  exit (0);
  return 0;
}

/* result
scheduler must be created before being started
end result */
