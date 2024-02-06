#include "fthread.h"
#include "stdio.h"

/* await_n */

ft_thread_t ft0, ft1;
ft_event_t start;

void pr (void *text)
{
   int i;
   ft_thread_await_n (start,100);
   for (i=0;i<10;i++) {
      fprintf (stdout,"%s",(char*)text);
      ft_thread_cooperate ();
   }
}

void control (void* args)
{
   ft_thread_join (ft0);
   exit (0);
}


int main (void)
{
  ft_scheduler_t sched = ft_scheduler_create ();
  start = ft_event_create (sched);

  ft1 = ft_thread_create (sched,control,NULL,NULL);
  ft0 = ft_thread_create (sched,pr,NULL,"Hello World!\n");

  ft_scheduler_start (sched);

  ft_exit ();
  return 0;
}

/* result
Hello World!
Hello World!
Hello World!
Hello World!
Hello World!
Hello World!
Hello World!
Hello World!
Hello World!
Hello World!
end result */
