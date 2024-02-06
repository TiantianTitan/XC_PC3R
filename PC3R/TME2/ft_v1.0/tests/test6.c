#include "fthread.h"
#include "stdio.h"

/* instantaneous dialog */

ft_thread_t ft0, ft1, ft2;
ft_event_t e1, e2, e3;

void r1 (void *text)
{
   ft_thread_await (e1);
   ft_thread_generate (e2);
   ft_thread_await (e3);
   fprintf (stdout,"e3 received!\n");

}

void r2 (void *text)
{
   ft_thread_generate (e1);
   ft_thread_await (e2);
   ft_thread_generate (e3);
   fprintf (stdout,"e3 generated!\n");
}

void control (void* args)
{
   ft_thread_join (ft0);
   ft_thread_join (ft1);
   exit (0);
}


int main (void)
{
  ft_scheduler_t sched = ft_scheduler_create ();
  e1 = ft_event_create(sched);
  e2 = ft_event_create(sched);
  e3 = ft_event_create(sched);

  ft2 = ft_thread_create (sched,control,NULL,NULL);
  ft1 = ft_thread_create (sched,r2,NULL,NULL);
  ft0 = ft_thread_create (sched,r1,NULL,NULL);

  ft_scheduler_start (sched);

  ft_exit ();
  return 0;
}

/* result
e3 generated!
e3 received!
end result */
