#include "fthread.h"
#include "stdio.h"

/* bad uses of ft_thread_scheduler */


void behav (void *args)
{
   ft_scheduler_t scheduler;
   fprintf (stdout, "running\n");
   scheduler = ft_thread_scheduler ();
   if (scheduler == NULL) fprintf (stdout, "bad scheduler 4\n");

   ft_thread_unlink ();

   scheduler = ft_thread_scheduler ();
   if (scheduler == NULL) fprintf (stdout, "bad scheduler 5 (unlinked)\n");

   fprintf (stdout, "ending\n");
   exit (0);
}

int main (void)
{
   ft_scheduler_t scheduler;
   ft_scheduler_t sched;

   scheduler = ft_thread_scheduler ();
   if (scheduler == NULL) fprintf (stdout, "bad scheduler 1\n");

   sched = ft_scheduler_create();

   scheduler = ft_thread_scheduler ();
   if (scheduler == NULL) fprintf (stdout, "bad scheduler 2\n");

   ft_thread_create(sched,behav,NULL,NULL);   

   ft_scheduler_start(sched);

   scheduler = ft_thread_scheduler ();
   if (scheduler == NULL) fprintf (stdout, "bad scheduler 3\n");

   ft_exit ();
   return 0;
}

/* result
bad scheduler 1
bad scheduler 2
bad scheduler 3
running
bad scheduler 5 (unlinked)
ending
end result */
