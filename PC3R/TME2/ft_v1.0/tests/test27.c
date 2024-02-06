#include "fthread.h"
#include "stdio.h"
#include <unistd.h>

/* locks owned by a fair thread are automatically released when it is stopped */

ft_thread_t th1,th2;

pthread_mutex_t mutex1 = PTHREAD_MUTEX_INITIALIZER;
pthread_mutex_t mutex2 = PTHREAD_MUTEX_INITIALIZER;

void b1 (void *args)
{
   ft_thread_mutex_lock (&mutex1);
   ft_thread_mutex_lock (&mutex2);
   fprintf (stdout,"take locks\n");
   while (1) ft_thread_cooperate ();
}

void b2 (void *args)
{
   ft_thread_cooperate_n (100);
   ft_scheduler_stop (th1);
   fprintf (stdout,"thread stopped\n");

   ft_thread_mutex_lock (&mutex1);
   ft_thread_mutex_lock (&mutex2);

   fprintf (stdout,"take locks\n");
   exit (0);
}

int main (void)
{
  ft_scheduler_t sched = ft_scheduler_create ();

  th1 = ft_thread_create (sched,b1,NULL,NULL);
  th2 = ft_thread_create (sched,b2,NULL,NULL);

  ft_scheduler_start (sched);

  ft_exit ();
  return 0;
}

/* result
take locks
thread stopped
take locks
end result */
