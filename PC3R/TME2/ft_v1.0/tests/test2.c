#include "fthread.h"
#include "stdio.h"

/* cooperate_n */

void pr (void *text)
{
   while (1){
      fprintf(stdout,"%s",(char*)text);
      ft_thread_cooperate();
   }
}

/* kill must be static!? */
static void kill (void* args)
{
   ft_thread_cooperate_n(10);
   exit(0);
}


int main(void)
{
  ft_scheduler_t sched = ft_scheduler_create ();

  ft_thread_create (sched,kill,NULL,(void*)10);
  ft_thread_create (sched,pr,NULL,"Hello ");
  ft_thread_create (sched,pr,NULL,"World!\n");

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
