#include "fthread.h"
#include <stdio.h>
#include <unistd.h>

/*************************************/
ft_scheduler_t sched;
ft_event_t answer;
ft_thread_t th, request, timer;

/*************************************/
void first_attempt (void *args)
{
   fprintf (stdout, "try connection with server1\n");      
   ft_thread_cooperate_n (5000);
   fprintf (stdout, "success of connection with server1\n");         
   ft_thread_generate (answer);
   ft_scheduler_stop ((ft_thread_t)args);
}

void timer1_behav (void *args)
{
   int n = 100;
   fprintf (stdout, "start timer for %d s\n",n);
   ft_thread_cooperate_n (n);
   fprintf (stdout, "end timer for %d s\n",n);
   fprintf (stdout, "stop connection with server1\n");
   ft_scheduler_stop ((ft_thread_t)args);
}

/*************************************/
void second_attempt (void *args)
{
   fprintf (stdout, "try connection with server2\n");      
   ft_thread_cooperate_n (4000);
   fprintf (stdout, "success of connection with server2\n");         
   ft_thread_generate (answer);

   ft_thread_cooperate ();
   ft_scheduler_stop ((ft_thread_t)args);
   ft_thread_generate (answer);   
}

void timer2_behav (void *args)
{
   int n = 6000;
   fprintf (stdout, "start timer for %d s\n",n);
   ft_thread_cooperate_n (n);
   fprintf (stdout, "end timer for %d s\n",n);
   ft_scheduler_stop ((ft_thread_t)args);
   fprintf (stdout, "stop connection with server2\n");
   fprintf (stdout, "no server available\n");
   ft_thread_generate (answer);   
}

/*************************************/
void handler (void *args)
{
   request = ft_thread_create (sched,second_attempt,NULL,timer);
   timer = ft_thread_create (sched,timer2_behav,NULL,request);
}

void behav (void *args)
{
   request = ft_thread_create (sched,first_attempt,handler,timer);
   timer = ft_thread_create (sched,timer1_behav,NULL,request);   
   
   ft_thread_await (answer);
   fprintf (stdout,"end of behav\n");
   exit (0);
}

/*************************************/
int main(void)
{
   sched = ft_scheduler_create ();
   answer = ft_event_create (sched);
   th = ft_thread_create (sched,behav,NULL,NULL);   

   ft_scheduler_start(sched);   

   ft_exit ();
   return 0;
}
