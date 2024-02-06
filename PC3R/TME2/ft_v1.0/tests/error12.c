#include "fthread.h"
#include "stdio.h"

/* bad uses of ft_thread_self */


void behav (void *args)
{
   ft_thread_t self;
   fprintf (stdout, "running\n");
   self = ft_thread_self ();
   if (self == NULL) fprintf (stdout, "bad self 4\n");

   ft_thread_unlink ();

   self = ft_thread_self ();
   if (self == NULL) fprintf (stdout, "bad self 5\n");

   fprintf (stdout, "ending\n");
   exit (0);
}

int main (void)
{
   ft_thread_t self;
   ft_scheduler_t sched;
   ft_thread_t th;

   self = ft_thread_self ();
   if (self == NULL) fprintf (stdout, "bad self 1\n");

   sched = ft_scheduler_create();
   th = ft_thread_create(sched,behav,NULL,NULL);   

   self = ft_thread_self ();
   if (self == NULL) fprintf (stdout, "bad self 2\n");

   ft_scheduler_start (sched);

   self = ft_thread_self ();
   if (self == NULL) fprintf (stdout, "bad self 3\n");

   ft_exit ();
   return 0;
}

/* result
bad self 1
bad self 2
bad self 3
running
ending
end result */
