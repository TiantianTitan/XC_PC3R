#define FT_MAGIC 123456789

#define _VERIFY_SCHEDULER_CREATION(sched)\
   if (sched == NULL || !_scheduler_well_created (sched)) return EBADCREATE

#define _VERIFY_EVENT_CREATION(event)\
   if (event == NULL || !_event_well_created (event)) return EBADCREATE

#define _VERIFY_THREAD_CREATION(thread)\
   if (thread == NULL || !_thread_well_created (thread)) return EBADCREATE
/*
#define _VERIFY_EVENT_LINKING(event)\
{\
  ft_thread_t self = ft_thread_self ();\
  if (self == NULL || _get_thread_scheduler (self) != _get_event_scheduler (event)) \
      return EBADLINK;\
}
*/
#define _VERIFY_EVENT_LINKING_TO_SCHEDULER(event,sched)\
  if (sched == NULL || sched != _get_event_scheduler (event)) return EBADLINK

#define _VERIFY_THREAD_LINKING(thread)\
   if (thread == NULL || _get_thread_scheduler (thread) == NULL) return EBADLINK

#define _VERIFY_THREAD_UNLINKING(thread)\
   if (thread == NULL || _get_thread_scheduler (thread) != NULL) return EBADLINK




#define _VERIFY_THREAD_CREATION_AND_LINK(thread)\
{\
if (thread == NULL || !_thread_well_created (thread)) return EBADCREATE;\
if (_get_thread_scheduler (thread) == NULL) return EBADLINK;\
}

#define _VERIFY_EVENT_CREATION_AND_SCHEDULER(event,sched)\
{\
   if (event == NULL || !_event_well_created (event)) return EBADCREATE;\
   if (sched == NULL || sched != _get_event_scheduler (event)) return EBADLINK;\
}
