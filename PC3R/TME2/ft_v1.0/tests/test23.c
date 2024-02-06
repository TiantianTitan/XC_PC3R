#include "fthread.h"
#include "stdio.h"

/* use the base pthread */

void* pr (void *text)
{
   int i;
   for (i=0;i<10;i++) {
      fprintf (stdout,"%s",(char*)text);
   }
   return NULL;
}

int main(void)
{
  int v, *cell = &v;
  ft_thread_t th1 = NULL, th2 = NULL;
  pthread_t pth1, pth2;

  pth1 = ft_pthread (th1);
  pth2 = ft_pthread (th2);

  pthread_create (&pth1,NULL,pr,"Hello ");
  pthread_create (&pth2,NULL,pr,"World!\n");  

  pthread_join (pth1,(void**)&cell);
  pthread_join (pth2,(void**)&cell);
  
  fprintf (stdout,"exit\n");

  return 0;
}

/* result
NONDETERMINISTIC 
end result */
