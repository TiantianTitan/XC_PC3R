#include "fthread.h"
#include <stdio.h>
#include <unistd.h>

/* actions in an unlinked thread */

void f (void *args)
{
   int v, *cell = &v;
   
   ft_thread_unlink ();
   if (OK != ft_thread_cooperate ()){
      fprintf (stdout,"cannot cooperate in an unlinked thread\n");
   }

   if (OK != ft_thread_cooperate_n (10)){
      fprintf (stdout,"cannot cooperate_n in an unlinked thread\n");
   }

   if (OK != ft_thread_unlink ()){
      fprintf (stdout,"cannot unlink an unlinked thread\n");
   }

   if (OK != ft_thread_generate ((ft_event_t)args)){
      fprintf (stdout,"cannot generate event in an unlinked thread\n");
   }

   if (OK != ft_scheduler_broadcast ((ft_event_t)args)){
      fprintf (stdout,"cannot broadcast event in an unlinked thread\n");
   }else fprintf (stdout,"CAN broadcast event in an unlinked thread\n");  
   
   if (OK != ft_thread_await ((ft_event_t)args)){
      fprintf (stdout,"cannot await event in an unlinked thread\n");
   }

   if (OK != ft_thread_await_n ((ft_event_t)args,10)){
      fprintf (stdout,"cannot await_n event in an unlinked thread\n");
   }

   if (OK != ft_thread_generate_value ((ft_event_t)args,(void*)3)){
      fprintf (stdout,"cannot generate valued event in an unlinked thread\n");
   }

   if (OK != ft_thread_get_value ((ft_event_t)args,0,(void**)&cell)){
      fprintf (stdout,"cannot get valued of an event in an unlinked thread\n");
   }
      
   exit(0);
}

int main (void)
{
  ft_scheduler_t sched = ft_scheduler_create ();
  ft_event_t evt = ft_event_create (sched);

  ft_thread_create (sched,f,NULL,evt);

  sleep(1);

  ft_scheduler_start (sched);

  ft_exit ();
  return 0;
}

/* result
cannot cooperate in an unlinked thread
cannot cooperate_n in an unlinked thread
cannot unlink an unlinked thread
cannot generate event in an unlinked thread
CAN broadcast event in an unlinked thread
cannot await event in an unlinked thread
cannot await_n event in an unlinked thread
cannot generate valued event in an unlinked thread
cannot get valued of an event in an unlinked thread
end result */
