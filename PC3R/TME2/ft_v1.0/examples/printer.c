#include "fthread.h"
#include "stdio.h"
#include <unistd.h> 

/*******************/
void *printer = NULL;
int printer_available;
int initialization_in_progress;
ft_event_t printer_ready;
ft_scheduler_t spooler;

void start_spooler ()
{
   printer_available = 0;
   initialization_in_progress = 0;
   spooler = ft_scheduler_create ();
   printer_ready = ft_event_create (spooler);
   ft_scheduler_start (spooler);   
}

void initialize_printer ()
{
   fprintf(stderr,"start printer initialization\n");
   initialization_in_progress = 1;
   ft_thread_unlink ();
   sleep (4);
   printer = &fprintf;
   ft_thread_link (spooler);
   printer_available = 1;
   fprintf (stderr,"printer initialized!\n");
}

void print (char *text)
{
   printer_available = 0;
   ft_thread_unlink ();
   fprintf (stderr,text);
   ft_thread_link (spooler);   
   printer_available = 1;
}

void lpr (char *text)
{
   ft_scheduler_t s = ft_thread_scheduler();
   ft_thread_unlink ();
   ft_thread_link (spooler);

   if (printer == NULL && !initialization_in_progress){
      initialize_printer ();
   }
   while (1) {
      if (printer_available) {
         print (text);
	 ft_thread_generate (printer_ready);
	 ft_thread_unlink ();
	 ft_thread_link (s);
	 return;
      }
      ft_thread_await (printer_ready);
      if (!printer_available) ft_thread_cooperate ();
   }
}
   
/*******************/
void behav (void *text)
{
   while (1) {
      lpr (text);
   }
}


void trace (void *text)
{
   while (1) {
      fprintf (stderr,"%s",(char*)text);
      ft_thread_cooperate ();
   }
}

/*******************/
int main (void)
{
  ft_scheduler_t sched = ft_scheduler_create ();
  
  start_spooler ();

  ft_thread_create (sched,behav,NULL,"0");
  ft_thread_create (sched,behav,NULL,"1");
  ft_thread_create (sched,behav,NULL,"2");
  ft_thread_create (sched,trace,NULL,"*");  

  ft_scheduler_start (sched);

  ft_exit ();
  return 0;
}
