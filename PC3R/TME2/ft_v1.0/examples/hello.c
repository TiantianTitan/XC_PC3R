#include "fthread.h"
#include "stdio.h"

void h (void *id)
{
   while (1) {
      fprintf (stderr,"Hello ");
      ft_thread_cooperate ();
   }
}

void w (void *id)
{
   while (1) {
      fprintf (stderr,"World!\n");
      ft_thread_cooperate ();
   }
}

int main(void)
{
  ft_scheduler_t sched = ft_scheduler_create ();

  ft_thread_create (sched,h,NULL,NULL);
  ft_thread_create (sched,w,NULL,NULL);

  ft_scheduler_start (sched);

  ft_exit ();
  return 0;
}
