#include "fthread.h"
#include "stdio.h"
#include <stdlib.h>

/* events are broadcast */

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
  for(i=0; i<max; i++) {
     ft_thread_join (table[i]);
  }
  exit (0);
}


int main(void)
{
  int i;
  ft_thread_t ft;
  
  sched = ft_scheduler_create ();
  evt = ft_event_create (sched);

  table = (ft_thread_t*)malloc (max*sizeof (ft_thread_t));
  for (i=0; i<max; i++) {
     table[i] = ft_thread_create(sched,fonc,NULL,NULL);
  }
  ft = ft_thread_create (sched,control,NULL,NULL);
  
  ft_scheduler_start(sched);

  ft_exit();
  return 0;
}

/* result
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
end result */
