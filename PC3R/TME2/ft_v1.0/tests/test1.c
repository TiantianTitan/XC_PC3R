#include "fthread.h"
#include "stdio.h"

/* the fifth parameter of ft_thread_create is passed to the function
   run by the thread */

void pr(void *text)
{
   int i;
   for (i=0;i<10;i++){
      fprintf(stdout,"%s",(char*)text);
      ft_thread_cooperate();
   }
   exit(0);
}

int main(void)
{
  ft_scheduler_t sched = ft_scheduler_create ();

  ft_thread_create (sched,pr,NULL,"Hello ");
  ft_thread_create (sched,pr,NULL,"World!\n");

  ft_scheduler_start(sched);

  ft_exit();
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
