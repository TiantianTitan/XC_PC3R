#include "fthread.h"
#include "stdio.h"
#include <stdlib.h>

/* thread creation */
   
int i = 10;

void behav (void *args)
{
   if (i > 0){
      ft_scheduler_t s = (ft_scheduler_t) args;
      i--;
      ft_thread_create (s,behav,NULL,s);
      ft_thread_cooperate ();
      fprintf (stdout,"new thread %d!\n",i);
   }else{
      fprintf (stdout,"no more thread!\n");
      fflush (stdout);
      exit(0);
   }
}

int main(void)
{
  ft_scheduler_t sched = ft_scheduler_create ();

  ft_thread_create (sched,behav,NULL,sched);

  ft_scheduler_start (sched);

  ft_exit ();
  return 0;
}

/* result
new thread 9!
new thread 8!
new thread 7!
new thread 6!
new thread 5!
new thread 4!
new thread 3!
new thread 2!
new thread 1!
new thread 0!
no more thread!
end result */
