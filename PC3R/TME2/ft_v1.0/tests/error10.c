#include "fthread.h"
#include "stdio.h"

/* cannot create an event before its scheduler */

int main(void)
{
  ft_scheduler_t sched = NULL;
  
  if (NULL == ft_event_create (sched)){
     fprintf (stdout,"cannot create an event before its scheduler\n");
  }

  sched = ft_scheduler_create ();
  ft_scheduler_start (sched);

  exit (0);
  return 0;
}

/* result
cannot create an event before its scheduler
end result */
