#include "fthread.h"
#include "stdio.h"

/* cooperating n times takes exactly n instants */

ft_thread_t th;

void awaiter (void *args)
{
   int i;
   for (i=0;i<5;i++) {
      fprintf (stdout, "[cooperate %d times ",i);         
      ft_thread_cooperate_n (i);
      fprintf (stdout, "] ");         
   }
   fprintf (stdout, "exit!\n");   
   exit (0);
}

int i = 1;
void trace_instant (void *args)
{
   while (1) {
      fprintf (stdout, "\ninstant %d: ",i);
      i++;
      ft_thread_cooperate ();
   }
}

int main (void)
{
   ft_scheduler_t sched = ft_scheduler_create ();

   ft_thread_create (sched,trace_instant,NULL,NULL);

   ft_thread_create (sched,awaiter,NULL,NULL);     

   ft_scheduler_start (sched);

   ft_exit ();
   return 0;
}

/* result
 
instant 1: [cooperate 0 times ] [cooperate 1 times
instant 2: ] [cooperate 2 times
instant 3:
instant 4: ] [cooperate 3 times
instant 5:
instant 6:
instant 7: ] [cooperate 4 times
instant 8:
instant 9:
instant 10:
instant 11: ] exit!
end result */
