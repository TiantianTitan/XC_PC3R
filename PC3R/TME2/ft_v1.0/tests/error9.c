#include "fthread.h"
#include "stdio.h"

/* a thread can be created before the scheduler */

void pr (void *text)
{
   int i;
   for (i=0;i<10;i++) {
      fprintf (stdout,"%s",(char*)text);
      ft_thread_cooperate ();
   }
}

int main(void)
{
  ft_scheduler_t sched = NULL;

  if (NULL == ft_thread_create (sched,pr,NULL,"Hello ")){
     fprintf (stdout,"cannot create a thread before its scheduler\n");
  }

  sched = ft_scheduler_create();
  ft_scheduler_start (sched);

  fprintf (stdout,"exit\n");

  exit (0);
  return 0;
}

/* result
cannot create a thread before its scheduler
exit
end result */
