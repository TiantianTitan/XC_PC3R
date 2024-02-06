#include "fthread.h"
#include "stdio.h"

/* join the base pthread is possible */

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
  int v, *cell = &v;
  ft_thread_t th1,th2;
  ft_scheduler_t sched = ft_scheduler_create ();

  th1 = ft_thread_create (sched,pr,NULL,"Hello ");
  th2 = ft_thread_create (sched,pr,NULL,"World!\n");

  ft_scheduler_start(sched);

  pthread_join (ft_pthread (th1),(void**)&cell);
  pthread_join (ft_pthread (th2),(void**)&cell);
  
  fprintf (stdout,"exit\n");
  exit (0);

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
exit
end result */
