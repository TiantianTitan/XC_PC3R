#include "fthread.h"
#include "stdio.h"
#include <unistd.h>

/* unlink/link */

/********************************************/
void behav (void *args)
{
   ft_scheduler_t s = ft_thread_scheduler ();
   ft_thread_unlink ();
   usleep (1);
   fprintf (stdout,"sleep finished\n");
   ft_thread_link (s);
   if (OK != ft_thread_generate ((ft_event_t)args))
      fprintf (stdout,"cannot generate event\n");
}

void control (void *args)
{
   ft_thread_await ((ft_event_t)args);
   fprintf (stdout,"exit\n");
   exit (0);
}

/********************************************/
int main (void)
{
  ft_scheduler_t sched = ft_scheduler_create ();
  ft_event_t evt = ft_event_create (sched);

  ft_thread_create (sched,control,NULL,(void*)evt);
  ft_thread_create (sched,behav,NULL,(void*)evt);

  ft_scheduler_start (sched);

  ft_exit ();
  return 0;
}

/* result
sleep finished
exit
end result */
