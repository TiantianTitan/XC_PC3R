#include "fthread.h"
#include "stdio.h"

/* await */

ft_thread_t ft0, ft1, ft2;
ft_event_t start;

void pr (void *text)
{
   int i;
   ft_thread_await (start);
   for (i=0;i<10;i++) {
      fprintf(stdout,"%s",(char*)text);
      ft_thread_cooperate ();
   }
}

void control (void* args)
{
   ft_thread_cooperate_n (5);   
   ft_thread_generate (start);
   ft_thread_join (ft0);
   ft_thread_join (ft1);
   exit(0);
}


int main (void)
{
  ft_scheduler_t sched = ft_scheduler_create ();
  start = ft_event_create (sched);

  ft2 = ft_thread_create (sched,control,NULL,NULL);
  ft0 = ft_thread_create (sched,pr,NULL,"Hello ");
  ft1 = ft_thread_create (sched,pr,NULL,"World!\n");

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
