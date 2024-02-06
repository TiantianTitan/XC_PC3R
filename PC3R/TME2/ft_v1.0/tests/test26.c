#include "fthread.h"
#include "stdio.h"

/* locks owned by a fair thread are automatically released when it terminates */

void take (void *args)
{
   fprintf (stdout,"take lock\n");
   ft_thread_mutex_lock ((pthread_mutex_t*)args);
   fprintf (stdout,"end\n");
}

int main (void)
{
   int v, *cell = &v;

   ft_scheduler_t sched = ft_scheduler_create ();

   pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
   
   ft_thread_t th1 = ft_thread_create (sched,take,NULL,&mutex);
   ft_thread_t th2 = ft_thread_create (sched,take,NULL,&mutex);

   ft_scheduler_start (sched);

   pthread_join (ft_pthread (th1),(void**)&cell);
   pthread_join (ft_pthread (th2),(void**)&cell);
   
   fprintf (stdout,"exit\n");
   exit (0);
   return 0;
}

/* result
take lock
end
take lock
end
exit
end result */
