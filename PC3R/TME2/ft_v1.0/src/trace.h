#define _TRACE(msg,lock) //fprintf(stderr,msg,(long)&lock)

#define _PTH_LOCK(lock)\
   {\
        _TRACE("LOCK THREAD %ld\n",lock);\
        pthread_mutex_lock (&lock);\
   }

#define _PTH_UNLOCK(lock)\
   {\
       _TRACE("UNLOCK THREAD %ld\n",lock);\
       pthread_mutex_unlock (&lock);\
   }

#define _PTH_WAIT(cond,lock)\
   {\
       _TRACE("UNLOCK THREAD %ld (wait)\n",lock);\
       pthread_cond_wait (&cond,&lock);\
       _TRACE("LOCK THREAD %ld (wait)\n",lock);\
   }

#define _PTH_NOTIFY(cond,lock)\
   {\
       _TRACE("NOTIFY THREAD %ld\n",lock);\
       pthread_cond_signal (&cond);\
   }

