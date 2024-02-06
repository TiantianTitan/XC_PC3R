#include "fthread.h"
#include "stdio.h"

/* thread starting */
/* Thread are started when the OS decided to do so.
   So, thread actual starting is asynchronous with thread creation */
   
int i = 0;

void countInstants (void *args)
{
   while (1) {
      i++;
      ft_thread_cooperate ();
   }
      
}

void f (void *args)
{
   fprintf (stdout,"executed at instant %d\n",i);
   exit (0);
}


int main (void)
{
  ft_scheduler_t sched = ft_scheduler_create ();

  ft_thread_create (sched,countInstants,NULL,NULL);

  ft_scheduler_start (sched);

  ft_thread_create (sched,f,NULL,NULL);
  fprintf (stdout,"created at instant %d\n",i);

  ft_exit ();
  return 0;
}

/* result
NONDETERMINISTIC
end result */
