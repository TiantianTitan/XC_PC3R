#include "fthread.h"
#include "stdio.h"

/* event must be created before broadcast */

int main (void)
{
  ft_scheduler_t sched = NULL;
  ft_event_t event = NULL;

  sched = ft_scheduler_create ();
  ft_scheduler_start (sched);

  //ft_event_create (&event,sched);

  if (EBADCREATE == ft_scheduler_broadcast (event)){
     fprintf (stdout,"bad event broadcast\n");
  }

  exit (0);
  return 0;
}

/* result
bad event broadcast
end result */
