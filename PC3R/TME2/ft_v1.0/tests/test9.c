#include "fthread.h"
#include "stdio.h"

/* stop */

void pr (void *text)
{
   while (1) {
      fprintf(stdout,"%s",(char*)text);
      ft_thread_cooperate ();
   }
}

void control (void* args)
{
   ft_thread_cooperate_n (10);
   ft_scheduler_stop ((ft_thread_t)args);
   fprintf (stdout,"stop\n");
   ft_thread_join ((ft_thread_t)args);
   fprintf (stdout,"exit\n");
   exit (0);
}

void traceInstants ()
{
   int i = 0;
   while (1) {
      fprintf (stdout,">>>>>>>>>>> instant %d\n",i++);
      ft_thread_cooperate ();
   }
}

int main (void)
{
  ft_thread_t ft;
  ft_scheduler_t sched = ft_scheduler_create ();

  ft_thread_create (sched,traceInstants,NULL,NULL);

  ft = ft_thread_create (sched,pr,NULL,"*");
  ft_thread_create (sched,control,NULL,(void*)ft);

  ft_scheduler_start (sched);

  ft_exit ();
  return 0;
}

/* result
>>>>>>>>>>> instant 0
*>>>>>>>>>>> instant 1
*>>>>>>>>>>> instant 2
*>>>>>>>>>>> instant 3
*>>>>>>>>>>> instant 4
*>>>>>>>>>>> instant 5
*>>>>>>>>>>> instant 6
*>>>>>>>>>>> instant 7
*>>>>>>>>>>> instant 8
*>>>>>>>>>>> instant 9
*>>>>>>>>>>> instant 10
*stop
>>>>>>>>>>> instant 11
exit
end result */
