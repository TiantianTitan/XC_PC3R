#include "fthread.h"
#include "stdio.h"

ft_event_t event1,event2;

void waiter1 (void *id)
{
   ft_thread_await_n (event1,10);
   ft_thread_generate (event2);
}


void waiter2 (void *id)
{
   ft_thread_await (event2);
   ft_thread_cooperate ();
   fprintf (stdout,"exit!\n");
   exit (0);
}

void traceInstants (void *args)
{
   int i = 0;
   while (1) {
      fprintf(stdout,"\n>>>>>>>>>>> instant %d: ",i++);
      ft_thread_cooperate ();
   }
}

int main(void)
{
   ft_scheduler_t sched = ft_scheduler_create();
   event1 = ft_event_create (sched);
   event2 = ft_event_create (sched);

   //ft_thread_create (sched,traceInstants,NULL,NULL); 
   ft_thread_create(sched,waiter1,NULL,NULL);
   ft_thread_create(sched,waiter2,NULL,NULL);  

   ft_scheduler_start(sched);

   ft_exit();
   return 0;
}

/* result
exit!
end result */
