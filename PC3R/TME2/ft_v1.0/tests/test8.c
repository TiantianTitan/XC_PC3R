#include "fthread.h"
#include "stdio.h"
#include <stdlib.h>

/* events are instantaneously broadcast */

int max = 10;
ft_scheduler_t sched;
ft_event_t evt;
ft_thread_t *table;

void fonc (void *args)
{
  fprintf (stdout,"start waiting!!!!!\n");  
  ft_thread_await (evt);
  fprintf (stdout,"received!!!!!\n");
}

void control (void* args)
{
  int i;
  ft_thread_cooperate_n (3);
  fprintf (stdout,"generated!!!!!\n");
  ft_thread_generate (evt);
  for(i=0; i<max; i++){
     ft_thread_join (table[i]);
  }
  ft_thread_cooperate ();
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
  int i;
  
  sched = ft_scheduler_create ();
  evt = ft_event_create (sched);

  table = (ft_thread_t*)malloc (max*sizeof (ft_thread_t));

  ft_thread_create (sched,traceInstants,NULL,NULL);  

  for (i=0; i<max; i++) {
     table[i] = ft_thread_create(sched,fonc,NULL,NULL);
  }
  
  ft_thread_create (sched,control,NULL,NULL);
  
  ft_scheduler_start(sched);

  ft_exit();
  return 0;
}

/* result
>>>>>>>>>>> instant 0
start waiting!!!!!
start waiting!!!!!
start waiting!!!!!
start waiting!!!!!
start waiting!!!!!
start waiting!!!!!
start waiting!!!!!
start waiting!!!!!
start waiting!!!!!
start waiting!!!!!
>>>>>>>>>>> instant 1
>>>>>>>>>>> instant 2
>>>>>>>>>>> instant 3
generated!!!!!
received!!!!!
received!!!!!
received!!!!!
received!!!!!
received!!!!!
received!!!!!
received!!!!!
received!!!!!
received!!!!!
received!!!!!
>>>>>>>>>>> instant 4
end result */
