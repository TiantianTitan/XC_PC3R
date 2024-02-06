#include "fthread_internal.h"

#define VALUES_CHUNK 10

/*******************************************/
struct ft_event_t
{
  int                           num;
  int                           instant;
  ft_scheduler_t                scheduler;
  void                        **values;
  int                           value_max;
  int                           value_count;
  int                           well_created; // == FT_MAGIC if creation is OK

  thread_list_t                 waiting;
};

/*******************************************/
int _event_well_created (ft_event_t event)
{
   return  event->well_created == FT_MAGIC;
}

ft_scheduler_t _get_event_scheduler (ft_event_t event)
{
   return  event->scheduler;
}

int _event_get_value (ft_event_t event,int index,void **result)
{
    if (_event_is_generated(event) && event->value_count > index) {
      (*result) = (event->values)[index];
      return 1;
    }
    return 0;
}

/*******************************************/
// thread-safe generation of a new index number for events
static pthread_mutex_t _event_lock;
static int             _event_num = 0;

static int new_event_num ()
{
   int res;
   if (_event_num == 0) pthread_mutex_init (&_event_lock,NULL);

   pthread_mutex_lock (&_event_lock);
   res = _event_num++;  
   pthread_mutex_unlock (&_event_lock);
   return res;
}

/********************************************/
// allocation of the array of values associated to an event
static void* values_malloc (ft_event_t evt)
{
   evt->value_max = VALUES_CHUNK;
   evt->values = malloc (1+evt->value_max*sizeof (void*));
   return evt->values;
}

static void* values_realloc (ft_event_t evt)
{
   evt->value_max += VALUES_CHUNK;
   evt->values = realloc (evt->values,1+evt->value_max*sizeof (void*));
   return evt->values;
}

/********************************************/
ft_event_t ft_event_create (ft_scheduler_t sched)
{
   ft_event_t new_event = malloc (sizeof (struct ft_event_t));
   if (new_event == NULL || sched == NULL || !_scheduler_well_created (sched)) return NULL;  

   new_event->num = new_event_num ();
   new_event->instant = -1;
   new_event->scheduler = sched;
   new_event->value_count = 0;

   if (values_malloc (new_event) == NULL) return NULL;
   if (_store_event (sched,new_event->num,new_event) == EBADMEM) return NULL;

   if (NULL == (new_event->waiting = _create_thread_list ())) return NULL;

   new_event->well_created = FT_MAGIC;
   //fprintf(stderr,"create event %d \n",new_event->num);
   return new_event;
}

/********************************************/
static int _awake_thread (ft_thread_t thread)
{
   if (_get_thread_status (thread) == _WAIT) {
      //fprintf (stderr, "awake thread %ld\n",thread);
      _set_thread_status (thread,_BLOCKED);
   }
   return 1;
}

static void _awake_waiting_threads (ft_event_t event)
{
   _apply_thread_list (event->waiting,_awake_thread);
}

void _event_store_thread (ft_event_t event,ft_thread_t thread)
{
   //fprintf (stderr, "store waiting thread %ld\n",thread);
   _add_thread_list (event->waiting,thread);
}

/********************************************/
int _event_is_generated (ft_event_t event)
{
   return event->instant == _get_scheduler_instant (event->scheduler);
}

// sets the mask and returns 1 if there is a generated event, 0 otherwise
int _fill_mask (int length,ft_event_t *events,int *mask)
{
   int res=0,i,pres;
   
   for (i=0;i<length;i++) {
      if ((pres = _event_is_generated (events[i]))) res = 1;
      if (mask != NULL) mask[i] = pres;
   }
   return res;
}

/********************************************/
void _event_generate (ft_event_t event)
{
   if(!_event_is_generated (event)) {
      event->instant = _get_scheduler_instant (event->scheduler);
      _set_scheduler_move (event->scheduler);
      event->value_count = 0;          // reset event values
      _awake_waiting_threads (event);  // awake threads waiting for the event
   }
}

int _event_generate_value (ft_event_t event,void *val)
{
   _event_generate (event);
   // may be somebody waits for using the new value...
   _set_scheduler_move (event->scheduler);
   if (event->value_count == event->value_max) {
      if (values_realloc (event) == NULL) return EBADMEM;
   }
   event->values[event->value_count++] = val;
   return OK;
}

