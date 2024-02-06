#include "fthread.h"
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>

/*********************************************/
ssize_t ft_thread_read (int fd,void *buf,size_t count)
{ 
   ft_scheduler_t sched = ft_thread_scheduler ();
   ssize_t res;
   
   ft_thread_unlink ();
   
   res = read (fd,buf,count);
   
   ft_thread_link (sched);
   return res;
}

/*********************************************/
void reading_behav (void* args)
{
   int max = (int)args;
   char *buf = (char*)malloc (max+1);
   ssize_t res;
   fprintf (stderr,"enter %d characters:\n",max);
   
   res = ft_thread_read (0,buf,max);
   
   if (-1 == res) fprintf (stderr,"error\n");
   buf[res] = 0;
   fprintf (stderr,"read %d: <%s>\n",res,buf);
   exit (0);
}

int main (void)
{
  ft_scheduler_t sched = ft_scheduler_create ();

  ft_thread_create (sched,reading_behav,NULL,(void*)5);

  ft_scheduler_start (sched);
  
  ft_exit();
  return 0;
}
