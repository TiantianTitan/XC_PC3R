#include "fthread.h"
#include "stdio.h"

/* use of locks */

long MAX = (long)1e5;
long V1 = 0, V2 = 0;
ft_thread_t ft0, ft1;

void unlinked (void *arg)
{
  int i;
  pthread_mutex_t* mutex = arg;

  ft_thread_unlink ();

  for (i=0;i<MAX;i++){
     ft_thread_mutex_lock (mutex);
     V1++;
     V2++;
     ft_thread_mutex_unlock (mutex);
     ft_thread_cooperate ();
  }
}

/************************************/
void join_behav (void* arg)
{
   ft_thread_join (ft0);
   ft_thread_join (ft1);
   fprintf (stdout,"V1: %ld, V2: %ld\n",V1,V2);
   exit (0);
}

/************************************/
int main (void)
{
  ft_scheduler_t sched = ft_scheduler_create ();
  pthread_mutex_t mutex;

  pthread_mutex_init (&mutex,NULL);

  ft0 = ft_thread_create (sched,unlinked,NULL,&mutex);
  ft1 = ft_thread_create (sched,unlinked,NULL,&mutex);
  ft_thread_create (sched,join_behav,NULL,NULL);

  ft_scheduler_start (sched);

  ft_exit ();
  return 0;
}

/* result
V1: 200000, V2: 200000
end result */
