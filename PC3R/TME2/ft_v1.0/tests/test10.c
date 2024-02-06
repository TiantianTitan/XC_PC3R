#include "fthread.h"
#include "stdio.h"

/* cleanup when stopping a thread */

void pr (void *text)
{
   while (1) {
      fprintf (stdout,"%s",(char*)text);
      ft_thread_cooperate ();
   }
}

void cleanup (void *args)
{
   fprintf (stdout,"clean up!!!!!!!!\n");
}

void control (void *args)
{
   ft_thread_t t = (ft_thread_t)args;
   ft_thread_cooperate_n (10);
   ft_scheduler_stop (t);
   fprintf (stdout,"stop\n");
   ft_thread_join (t);
   fprintf (stdout,"exit\n");
   exit(0);
}

int main (void)
{
  ft_thread_t ft;
  ft_scheduler_t sched = ft_scheduler_create ();

  ft = ft_thread_create (sched,pr,cleanup,"*");
  if (ft == NULL) {
    fprintf (stderr,"error!!!\n"); exit (-1);    
  }
  ft_thread_create (sched,control,NULL,(void*)ft);

  ft_scheduler_start (sched);

  ft_exit ();
  return 0;
}

/* result
***********stop
clean up!!!!!!!!
exit
end result */
