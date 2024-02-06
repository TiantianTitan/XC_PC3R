#include "fthread.h"
#include "stdio.h"

/* join_n */

ft_thread_t ft0, ft1, ft2;


void pr (void *text)
{
   while (1) {
      fprintf(stdout,"%s",(char*)text);
      ft_thread_cooperate ();
   }
}

/* kill must be static!? */
static void kill (void* args)
{
   ft_thread_join_n (ft0,10);
   ft_thread_join_n (ft1,10);
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
