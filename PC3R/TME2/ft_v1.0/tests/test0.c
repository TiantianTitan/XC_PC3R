#include "fthread.h"
#include "stdio.h"

void h(void *id)
{
   int i;
   for (i=0;i<10;i++){
      fprintf(stdout,"Hello ");
      ft_thread_cooperate();
   }
   exit(0);
}

void w(void *id)
{
   int i;
   for (i=0;i<10;i++){
      fprintf(stdout,"World!\n");
      ft_thread_cooperate();
   }
   exit(0);
}

int main(void)
{
  ft_scheduler_t sched = ft_scheduler_create();

  ft_thread_create(sched,h,NULL,NULL);
  ft_thread_create(sched,w,NULL,NULL);

  ft_scheduler_start(sched);

  pthread_exit (0);
  //ft_exit();
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
