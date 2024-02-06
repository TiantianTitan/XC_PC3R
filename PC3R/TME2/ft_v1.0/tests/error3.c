#include "fthread.h"
#include <stdio.h>
#include <unistd.h>

/* join in an unlinked thread */

void j (void *args)
{
   ft_thread_unlink ();
   if (OK != ft_thread_join ((ft_thread_t)args)){
      fprintf (stdout,"cannot join in an unlinked thread\n");
   }
   exit (0);
}

void n (void *args)
{
   while (1) ft_thread_cooperate ();
}

int main(void)
{
  ft_scheduler_t sched = ft_scheduler_create ();
  ft_thread_t th2 = ft_thread_create (sched,n,NULL,NULL);  

  ft_thread_create (sched,j,NULL,th2);

  ft_scheduler_start (sched);

  ft_exit ();
  return 0;
}

/* result
cannot join in an unlinked thread
end result */
