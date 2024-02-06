#include "fthread.h"
#include <stdio.h>
#include <unistd.h>

/* automata can be joined, just as standard threads */

/*************************************/
ft_event_t e1, e2;
ft_thread_t a1,a2;

/*************************************/
DEFINE_AUTOMATON(behav1)
{
  BEGIN_AUTOMATON
     STATE(0)
        fprintf (stdout,"broadcast e1\n");
        ft_thread_generate (e1);
     STATE(1)
        fprintf (stdout,"wait e2\n");
     STATE_AWAIT(2,e2)
        fprintf (stdout,"receive e2\n");            
     STATE(3)
        fprintf (stdout,"end of behav1\n");
  END_AUTOMATON
}

DEFINE_AUTOMATON(behav2)
{
  BEGIN_AUTOMATON
     STATE(0)
        fprintf (stdout,"wait e1\n");
     STATE_AWAIT(1,e1)
        fprintf (stdout,"receive e1\n");            
     STATE(2)
	ft_thread_generate (e2);
        fprintf (stdout,"broadcast e2\n");
     STATE(3)
        fprintf (stdout,"end of behav2\n");
  END_AUTOMATON
}


/*************************************/
void waiter (void *args)
{
   ft_thread_join (a1);
   ft_thread_join (a2);
   fprintf (stdout, "exit!\n");
   exit (0);
}

int main(void)
{
   ft_scheduler_t sched = ft_scheduler_create ();

   e1 = ft_event_create (sched);
   e2 = ft_event_create (sched);   

   ft_thread_create (sched,waiter,NULL,NULL); 

   a1 = ft_automaton_create (sched,behav1,NULL,NULL);   
   a2 = ft_automaton_create (sched,behav2,NULL,NULL);

   ft_scheduler_start (sched);   
   
   ft_exit ();
   return 0;
}

/* result
broadcast e1
wait e2
wait e1
receive e1
broadcast e2
end of behav2
receive e2
end of behav1
exit!
end result */
