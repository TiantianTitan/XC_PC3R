#include "fthread_internal.h"

/************************************************/
int ft_thread_cooperate ()
{
   ft_thread_t self  = ft_thread_self ();

   _VERIFY_THREAD_CREATION_AND_LINK (self);

   _release(self,_DONE);
   return OK;
} 

int ft_thread_cooperate_n (int delay)
{ 
   int deadline;
   ft_thread_t    self  = ft_thread_self ();
   ft_scheduler_t sched = ft_thread_scheduler ();

   _VERIFY_THREAD_CREATION_AND_LINK (self);

   deadline = delay + _get_scheduler_instant (sched);
   
   while (1) {
      if (deadline <= _get_scheduler_instant (sched)) return OK;
      _POST_TIMER (self,sched,deadline);
      _release (self,_WAIT);      
   }
}

/************************************************/
int ft_thread_await (ft_event_t event)
{
   ft_thread_t    self  = ft_thread_self ();
   ft_scheduler_t sched = ft_thread_scheduler ();

   _VERIFY_THREAD_CREATION_AND_LINK (self);
   _VERIFY_EVENT_CREATION_AND_SCHEDULER (event,sched);

   while (1) {
      if (_event_is_generated(event)) return OK;                   // present
      else if (_get_scheduler_eoi (sched)) _release (self,_DONE);  // absent
      else {
	 _POST_EVENT (event,self);
	 _release (self,_WAIT);
      }
   } 
}

int ft_thread_await_n (ft_event_t event,int delay)
{ 
   int deadline;
   ft_thread_t    self  = ft_thread_self ();
   ft_scheduler_t sched = ft_thread_scheduler ();

   _VERIFY_THREAD_CREATION_AND_LINK (self);
   _VERIFY_EVENT_CREATION_AND_SCHEDULER (event,sched);
   
   deadline = delay + _get_scheduler_instant (sched);
  
   while(1) {
      _CONTROL_TIMEOUT (deadline,sched);
      if (_event_is_generated (event)) return OK;
      else if (_get_scheduler_eoi (sched)) _release (self,_DONE);
      else {
	 _POST_TIMER (self,sched,deadline);	 
	 _POST_EVENT (event,self);
	 _release (self,_WAIT);
      }
   }
}

/************************************************/
int ft_thread_join (ft_thread_t thread)
{
   ft_thread_t    self   = ft_thread_self ();
   ft_scheduler_t sched  = ft_thread_scheduler ();
  
   _VERIFY_THREAD_CREATION_AND_LINK (self);
   _VERIFY_THREAD_CREATION (thread);

   while (1) {
      if (_get_thread_status (thread) == _TERMINATED) {
	 /* if termination comes from an asynchronous thread
	    and somebody also waits for termination, one must
	    be sure that it sees termination at the same instant. */
	 _set_scheduler_move (sched); 
	 return OK;
      } else if (_get_scheduler_eoi (sched)) _release (self,_DONE);
      else _release (self,_BLOCKED);
   }
}

int ft_thread_join_n (ft_thread_t thread,int delay)
{
   int deadline;
   ft_thread_t    self   = ft_thread_self ();
   ft_scheduler_t sched  = ft_thread_scheduler ();
  
   _VERIFY_THREAD_CREATION_AND_LINK (self);
   _VERIFY_THREAD_CREATION (thread);
  
   deadline = delay + _get_scheduler_instant (sched);
   
   while(1) {
      _CONTROL_TIMEOUT (deadline,sched);
      if (_get_thread_status (thread) == _TERMINATED) {
	 _set_scheduler_move (sched); 
	 return OK;
      } else if (_get_scheduler_eoi (sched) == 1) {
	 delay--;
	 _release (self,_DONE);
      } else _release (self,_BLOCKED);
   }
}

/************************************************/
int ft_thread_get_value (ft_event_t event,int index,void **result)
{
   ft_thread_t    self  = ft_thread_self ();
   ft_scheduler_t sched = ft_thread_scheduler ();

   _VERIFY_THREAD_CREATION_AND_LINK (self);
   _VERIFY_EVENT_CREATION_AND_SCHEDULER (event,sched);

   while(1) {
      if (_event_get_value (event,index,result)) return OK;
      if (_get_scheduler_eoi (sched) == 1) break;
      _release (self,_BLOCKED);
   }
   _release (self,_DONE);
   result = NULL;
   return ENEXT;
}

/************************************************/
int ft_thread_generate (ft_event_t event)
{
   ft_thread_t    self  = ft_thread_self ();
   ft_scheduler_t sched = ft_thread_scheduler ();

   _VERIFY_THREAD_CREATION_AND_LINK (self);
   _VERIFY_EVENT_CREATION_AND_SCHEDULER (event,sched);
   
   _event_generate (event);
   return OK;
}

int ft_thread_generate_value (ft_event_t event,void* val)
{
   ft_thread_t    self  = ft_thread_self ();
   ft_scheduler_t sched = ft_thread_scheduler ();

   _VERIFY_THREAD_CREATION_AND_LINK (self);
   _VERIFY_EVENT_CREATION_AND_SCHEDULER (event,sched);

   return _event_generate_value (event,val);
}

/************************************************/
int ft_thread_mutex_lock (pthread_mutex_t *mutex)
{
   ft_thread_t    self  = ft_thread_self ();
   ft_scheduler_t sched = ft_thread_scheduler ();
   
   if (self == NULL || sched == NULL) return pthread_mutex_lock(mutex);

   _add_lock (self,mutex);
   
   while(1){
     if (_get_scheduler_eoi (sched) == 1) {
	_release (self,_DONE);
     }else if (pthread_mutex_trylock (mutex) == OK) {
	return OK;
     }else{
	_release (self,_BLOCKED);
     }
   }
}

int ft_thread_mutex_unlock (pthread_mutex_t *mutex)
{
   ft_thread_t self = ft_thread_self ();
   
   int res = pthread_mutex_unlock (mutex);
   
   if (self != NULL) {
      ft_scheduler_t sched = _get_thread_scheduler (self);
      if (sched != NULL){
	 _set_scheduler_move (sched);
         _remove_lock (self,mutex);
      }
   }
   return res;
}

/***********************************************/
int ft_thread_select (int length,ft_event_t *events,int *mask)
{
   int i;
   ft_thread_t    self  = ft_thread_self ();
   ft_scheduler_t sched = ft_thread_scheduler ();

   _VERIFY_THREAD_CREATION_AND_LINK (self);

   for (i=0;i<length;i++) {
      _VERIFY_EVENT_CREATION_AND_SCHEDULER (events[i],sched);      
   }

   while (1) {
      if (_fill_mask (length,events,mask)) return OK;
      else if (_get_scheduler_eoi (sched)) _release (self,_DONE);
      else {
	 for (i=0;i<length;i++) _POST_EVENT (events[i],self);
	 _release (self,_WAIT);
      }
   } 
}

int ft_thread_select_n (int length,ft_event_t *events,int *mask,int delay)
{
   int deadline,i;
   ft_thread_t    self  = ft_thread_self ();
   ft_scheduler_t sched = ft_thread_scheduler ();

   _VERIFY_THREAD_CREATION_AND_LINK (self);

   for (i=0;i<length;i++) {
      _VERIFY_EVENT_CREATION_AND_SCHEDULER (events[i],sched);
   }

   deadline = delay + _get_scheduler_instant (sched);
   
   while (1) {
      _CONTROL_TIMEOUT (deadline,sched);
      if (_fill_mask (length,events,mask)) return OK;
      else if (_get_scheduler_eoi (sched)) _release (self,_DONE);
      else {
	 for (i=0;i<length;i++) _POST_EVENT (events[i],self);
	 _POST_TIMER (self,sched,deadline);	 
	 _release (self,_WAIT);
      }
   } 
}

/********************************************/
int ft_thread_unlink (void)
{
   int res;
   ft_thread_t self = ft_thread_self ();

   _VERIFY_THREAD_CREATION_AND_LINK (self);

   res = _register_unlink_order (self);
   if (res != OK) return res;

   return ft_thread_cooperate ();
}

int ft_thread_link (ft_scheduler_t sched)
{
   ft_thread_t self  = ft_thread_self ();

  _VERIFY_THREAD_CREATION (self);
  _VERIFY_THREAD_UNLINKING (self);
  _VERIFY_SCHEDULER_CREATION (sched);

  _set_thread_scheduler (self,sched);

  return _start_phase (self);
}
