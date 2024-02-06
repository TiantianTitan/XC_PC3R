#include "fthread.h"
#include <stdio.h>
#include <unistd.h>

/*************************************/
ft_event_t e1, e2;

/*************************************/
void behav1 (void *args)
{
  ft_thread_generate (e1);
  fprintf (stdout,"broadcast e1\n");  

  fprintf (stdout,"wait e2\n");      
  ft_thread_await (e2);
  fprintf (stdout,"receive e2\n");            

  fprintf (stdout,"end of behav1\n");
}

void behav2 (void *args)
{
  fprintf (stdout,"wait e1\n");        
  ft_thread_await (e1);
  fprintf (stdout,"receive e1\n");          

  ft_thread_generate (e2);
  fprintf (stdout,"broadcast e2\n");    

  fprintf (stdout,"end of behav2\n");
}

/*************************************/
int main(void)
{
   int c, *cell = &c;
   ft_thread_t th1, th2;
   ft_scheduler_t sched = ft_scheduler_create ();

   e1 = ft_event_create (sched);
   e2 = ft_event_create (sched);   

   th1 = ft_thread_create (sched,behav1,NULL,NULL);   
   th2 = ft_thread_create (sched,behav2,NULL,NULL);

   ft_scheduler_start (sched);   

   pthread_join (ft_pthread (th1),(void**)&cell);
   pthread_join (ft_pthread (th2),(void**)&cell);
   fprintf (stdout,"exit\n");
   exit (0);
}

/*
broadcast e1
wait e2
wait e1
receive e1
broadcast e2
end of behav2
receive e2
end of behav1
exit
*/
