#include "fthread.h"
#include "stdio.h"
#include <unistd.h>

ft_event_t event;

void waiter (void *id)
{
   ft_thread_await (event);
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
   event = ft_event_create (sched);

   //ft_thread_create (sched,traceInstants,NULL,NULL); 
   ft_thread_create(sched,waiter,NULL,NULL);

   ft_scheduler_start(sched);

   sleep (1);
   ft_scheduler_broadcast (event);

   ft_exit();
   return 0;
}

/* result
exit!
end result */
