#include "fthread.h"
#include <unistd.h>
#include "stdio.h"

/* timeout */

void f (void *args)
{
   int res;
   if (ETIMEOUT == (res = ft_thread_await_n ((ft_event_t)args,10))){
      fprintf (stdout,"await_n reaches timeout\n");
   }

   while (1) ft_thread_cooperate ();
}

void g (void *args)
{
   int res;
   ft_thread_cooperate ();
   if (ETIMEOUT == (res = ft_thread_join_n ((ft_thread_t)args,20))){
      fprintf (stdout,"join_n reaches timeout\n");
   }else fprintf (stdout,"join_n %d\n",res);
   exit (0);
}

int main (void)
{
  ft_scheduler_t sched = ft_scheduler_create ();
  ft_event_t evt = ft_event_create (sched);
  
  ft_thread_t th1 = ft_thread_create (sched,f,NULL,evt);
  ft_thread_create (sched,g,NULL,th1);

  ft_scheduler_start (sched);

  ft_exit ();
  return 0;
}

/* result
await_n reaches timeout
join_n reaches timeout 
end result */
