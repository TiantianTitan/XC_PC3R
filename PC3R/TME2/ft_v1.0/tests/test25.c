#include "fthread.h"
#include "stdio.h"
#include <unistd.h>

/* use of locks */

int v1 = 0, v2 = 0;

void unlink_incr (void *args)
{
   int i;
   ft_thread_unlink ();
   
   for (i=0;i<1000000000;i++) {
      ft_thread_mutex_lock ((pthread_mutex_t*)args);
      v1++;
      //usleep (1);
      v2++;
      ft_thread_mutex_unlock ((pthread_mutex_t*)args);
      //fprintf (stdout,"unlink: %d - %d\n",v1,v2);      
      //usleep (1);
   }
}

void link_incr (void *args)
{
   int i;
   for (i=0;i<100;i++) {
      ft_thread_mutex_lock ((pthread_mutex_t*)args);
      v1++;
      ft_thread_cooperate_n (100);
      v2++;
      ft_thread_mutex_unlock ((pthread_mutex_t*)args);
      ft_thread_cooperate ();
      //fprintf (stdout,"link: %d - %d\n",v1,v2);            
   }
}

int main (void)
{
  int v, *cell = &v;
  ft_thread_t th1,th2,th3;
  ft_scheduler_t sched = ft_scheduler_create ();
  pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;

  th1 = ft_thread_create (sched,unlink_incr,NULL,&mutex);
  th2 = ft_thread_create (sched,link_incr,NULL,&mutex);
  th3 = ft_thread_create (sched,link_incr,NULL,&mutex);

  ft_scheduler_start (sched);

  pthread_join(ft_pthread(th2),(void**)&cell);
  pthread_join(ft_pthread(th3),(void**)&cell);  
  fprintf (stdout,"values: %d - %d\n",v1,v2);

  exit (0);
  return 0;
}

/* result
NONDETERMINISTIC but values should be equal
end result */
