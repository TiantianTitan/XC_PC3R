#include "fthread_internal.h"

/*********************************************************/
int _automaton_await (ft_thread_t self,ft_event_t event)
{
   ft_scheduler_t sched = _get_thread_scheduler (self);

   _VERIFY_THREAD_CREATION_AND_LINK (self);
   _VERIFY_EVENT_CREATION_AND_SCHEDULER (event,sched);

   if (!_event_is_generated (event)) {
	 _POST_EVENT (event,self);
	 _set_thread_status (self,_WAIT);
	 return _STAY;
   }
   return OK;
}

int _automaton_await_n (ft_thread_t self,ft_event_t event,int delay)
{
   int current,deadline;
   ft_scheduler_t sched = _get_thread_scheduler (self);

   _VERIFY_THREAD_CREATION_AND_LINK (self);
   _VERIFY_EVENT_CREATION_AND_SCHEDULER (event,sched);

   deadline = _get_thread_deadline (self);
   current = _get_scheduler_instant (sched);	   

   if (deadline == -1) {
      _set_thread_deadline (self,(deadline = delay + current));
   }

   if (deadline > current && !_event_is_generated (event)) {
         _POST_TIMER (self,sched,deadline);
         _POST_EVENT (event,self);
	 _set_thread_status (self,_WAIT);
	 return _STAY;      
   }
   _set_thread_deadline (self,-1);
   if (deadline <= current) return ETIMEOUT;
   return OK;
}

/*********************************************************/
int _automaton_get_value (ft_thread_t self,ft_event_t event,int index,void **result)
{
   ft_scheduler_t sched = _get_thread_scheduler (self);

   _VERIFY_THREAD_CREATION_AND_LINK (self);
   _VERIFY_EVENT_CREATION_AND_SCHEDULER (event,sched);

   if (_get_thread_deadline (self) == _get_scheduler_instant (sched)) {
      _set_thread_deadline (self,-1);
      result = NULL;
      return ENEXT;      
   }
   
   if (_event_get_value (event,index,result)) return OK;
   
   if (_get_scheduler_eoi (sched) == 1) {
      _set_thread_deadline (self,_get_scheduler_instant (sched)+1);
      _set_thread_status (self,_DONE);
      return _STAY;
   }

   _set_thread_status (self,_BLOCKED);
   return _STAY;
}

/*********************************************************/
int _automaton_stay (ft_thread_t self,int delay)
{
   int current,deadline;
   ft_scheduler_t sched = _get_thread_scheduler (self);

   _VERIFY_THREAD_CREATION_AND_LINK (self);

   deadline = _get_thread_deadline (self);
   current = _get_scheduler_instant (sched);	   

   if (deadline == -1) {
      _set_thread_deadline (self,(deadline = delay + current));
   }

   if (deadline > current) {
      _POST_TIMER (self,sched,deadline);
      _set_thread_status (self,_WAIT);
      return _STAY;      
   }
   _set_thread_deadline (self,-1);
   return OK;
}

/*********************************************************/
int _automaton_join (ft_thread_t self,ft_thread_t thread)
{
   ft_scheduler_t sched = _get_thread_scheduler (self);   
  
   _VERIFY_THREAD_CREATION_AND_LINK (self);
   _VERIFY_THREAD_CREATION (thread);

   if (_get_thread_status (thread) == _TERMINATED) {
      _set_scheduler_move (sched); 
      return OK;
   } else if (_get_scheduler_eoi (sched)) {
      _set_thread_status (self,_DONE);
      return _STAY;      
   } else {
      _set_thread_status (self,_BLOCKED);
      return _STAY;
   }
}

int _automaton_join_n (ft_thread_t self,ft_thread_t thread,int delay)
{
   int current,deadline;
   ft_scheduler_t sched = _get_thread_scheduler (self);   
  
   _VERIFY_THREAD_CREATION_AND_LINK (self);
   _VERIFY_THREAD_CREATION (thread);

   deadline = _get_thread_deadline (self);
   current = _get_scheduler_instant (sched);	   

   if (deadline == -1) {
      _set_thread_deadline (self,(deadline = delay + current));
   }

   if (deadline <= current) {
      _set_thread_deadline (self,-1);
      return ETIMEOUT;
   }
   
   if (_get_thread_status (thread) == _TERMINATED) {
      _set_scheduler_move (sched);
      _set_thread_deadline (self,-1);	 
      return OK;
   } else if (_get_scheduler_eoi (sched)) {
      _set_thread_status (self,_DONE);
      return _STAY;      
   } else {
      _set_thread_status (self,_BLOCKED);
      return _STAY;
   }
}

/*********************************************************/
int _automaton_select (ft_thread_t self,int length,ft_event_t *events,int *mask)
{
   int i;
   ft_scheduler_t sched = _get_thread_scheduler (self);

   _VERIFY_THREAD_CREATION_AND_LINK (self);

   for (i=0;i<length;i++) {
      _VERIFY_EVENT_CREATION_AND_SCHEDULER (events[i],sched);      
   }

   if (_fill_mask (length,events,mask)) {
      return OK;
   } else if (_get_scheduler_eoi (sched)) {
      _set_thread_status (self,_DONE);
      return _STAY;
   } else {
      for (i=0;i<length;i++) _POST_EVENT (events[i],self);
      _set_thread_status (self,_WAIT);
      return _STAY;
   }
}

int _automaton_select_n (ft_thread_t self,int length,ft_event_t *events,int *mask,int delay)
{
   int current,deadline,i;
   ft_scheduler_t sched = _get_thread_scheduler (self);

   _VERIFY_THREAD_CREATION_AND_LINK (self);

   for (i=0;i<length;i++) {
      _VERIFY_EVENT_CREATION_AND_SCHEDULER (events[i],sched);
   }

   deadline = _get_thread_deadline (self);
   current = _get_scheduler_instant (sched);	   

   if (deadline == -1) {
      _set_thread_deadline (self,(deadline = delay + current));
   }

   _CONTROL_TIMEOUT (deadline,sched);
   if (_fill_mask (length,events,mask)) {
      _set_thread_deadline (self,-1);
      return OK;
   } else if (_get_scheduler_eoi (sched)) {
      _set_thread_status (self,_DONE);
      return _STAY;
   } else {
      for (i=0;i<length;i++) _POST_EVENT (events[i],self);
      _POST_TIMER (self,sched,deadline);	 
      _set_thread_status (self,_WAIT);
      return _STAY;
   }
} 
