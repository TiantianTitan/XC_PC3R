#include "fthread.h"
#include "stdio.h"

/* join */

ft_thread_t ft0, ft1, ft2;

void pr (void *text)
{
   int i;
   for (i=0;i<10;i++) {
      fprintf(stdout,"%s",(char*)text);
       ft_thread_cooperate ();
   }
}

/* kill must be static!? */
static void kill (void* args)
{
   ft_thread_join (ft0);
   ft_thread_join (ft1);
   exit (0);
}


int main(void)
{
  ft_scheduler_t sched = ft_scheduler_create ();

  ft2 = ft_thread_create (sched,kill,NULL,NULL);
  ft0 = ft_thread_create (sched,pr,NULL,"Hello ");
  ft1 = ft_thread_create (sched,pr,NULL,"World!\n");

  ft_scheduler_start (sched);

  ft_exit ();
  return 0;
}

/* result
Hello World!
Hello World!
Hello World!
Hello World!
Hello World!
Hello World!
Hello World!
Hello World!
Hello World!
Hello World!
end result */
