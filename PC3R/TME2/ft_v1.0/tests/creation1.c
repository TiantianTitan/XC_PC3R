#include "fthread.h"
#include <stdio.h>

/* use of ft_pthread to detach created threads.
   5000 threads are created, one after the other.
   Without calling detach, it would not be possible
   to create as many threads.
 */

ft_thread_t th;
ft_scheduler_t sched;

void func (void *args)
{
   int i = (int)args;
   if (i%100 == 0) {
      fprintf (stdout, "%d ",i);
      fflush (stdout);
   }
}

void creator (void *args)
{
   int i;
   for (i=0;i<5000;i++) {
      th = ft_thread_create (sched,func,NULL,(void*)i);
      pthread_detach (ft_pthread (th));
      ft_thread_cooperate_n (100);

      ft_thread_join (th);
   }
   fprintf (stdout, "\nexit\n");
   exit (0);
}

int main ()
{
   sched = ft_scheduler_create ();

   ft_scheduler_start (sched);

   ft_thread_create (sched,creator,NULL,NULL);
   
   ft_exit ();
   
   return 0;
}

/* result
0 100 200 300 400 500 600 700 800 900 1000 1100 1200 1300 1400 1500 1600 1700 1800 1900 2000 2100 2200 2300 2400 2500 2600 2700 2800 2900 3000 3100 3200 3300 3400 3500 3600 3700 3800 3900 4000 4100 4200 4300 4400 4500 4600 4700 4800 4900
exit
end result */
