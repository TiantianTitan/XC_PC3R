#include <pthread.h>
#include <stdio.h>
#include <unistd.h>

/*************************************/
pthread_mutex_t mutex1 = PTHREAD_MUTEX_INITIALIZER;
pthread_mutex_t mutex2 = PTHREAD_MUTEX_INITIALIZER;

pthread_cond_t e1 = PTHREAD_COND_INITIALIZER;
pthread_cond_t e2 = PTHREAD_COND_INITIALIZER;

/*************************************/
void* behav1 (void *args)
{
   //usleep(1); // OK with sleep
  pthread_mutex_lock (&mutex1);
  pthread_cond_broadcast (&e1);
  fprintf (stdout,"broadcast e1\n");  
  pthread_mutex_unlock (&mutex1);

  pthread_mutex_lock (&mutex2);
  fprintf (stdout,"wait e2\n");      
  pthread_cond_wait (&e2,&mutex2);
  fprintf (stdout,"receive e2\n");            
  pthread_mutex_unlock (&mutex2);

  fprintf (stdout,"end of behav1\n");
  
  return NULL;
}

void* behav2 (void *args)
{
  pthread_mutex_lock (&mutex1);
  fprintf (stdout,"wait e1\n");        
  pthread_cond_wait (&e1,&mutex1);
  fprintf (stdout,"receive e1\n");          
  pthread_mutex_unlock (&mutex1);

  pthread_mutex_lock (&mutex2);
  pthread_cond_broadcast (&e2);
  fprintf (stdout,"broadcast e2\n");    
  pthread_mutex_unlock (&mutex2);

  fprintf (stdout,"end of behav2\n");  
  
  return NULL;
}

/*************************************/
int main(void)
{
   int c, *cell = &c;
   pthread_t th1, th2;

   pthread_create (&th1,NULL,behav1,NULL);
   pthread_create (&th2,NULL,behav2,NULL);
   
   pthread_join(th1,(void**)&cell);
   pthread_join(th2,(void**)&cell);   
   fprintf (stdout,"exit\n");
   exit (0);
}

/*
Does not always work (terminate)...
*/
