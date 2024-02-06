#include "fthread_internal.h"

#define ENVIRONMENT_CHUNK 100;

/*****************************************************/
struct ft_environment_t
{
   int                   move;
   int                   eoi;
   int                   instant;
   int                   size;
   ft_event_t           *event_set;
   thread_list_t         timer;
};

/*****************************************************/
int _get_environment_eoi (ft_environment_t env)
{
   return env->eoi;
}
void _set_environment_eoi (ft_environment_t env,int b)
{
   env->eoi = b;
}

int _get_environment_move (ft_environment_t env)
{
   return env->move;
}
void _set_environment_move (ft_environment_t env,int b)
{
   env->move = b;
}

int _get_environment_instant (ft_environment_t env)
{
   return env->instant;
}

int _timer_size (ft_environment_t env)
{
   return _get_length_thread_list (env->timer);
}
/*****************************************************/
static void _event_set_malloc (ft_environment_t env)
{
   env->size = ENVIRONMENT_CHUNK;
   env->event_set = malloc (env->size*sizeof (ft_event_t));
   //fprintf(stderr,"allocation of %d events at %d!!!!\n",env->size,env->event_set);
}

static void _event_set_realloc (ft_environment_t env)
{
   env->size += ENVIRONMENT_CHUNK;  
   env->event_set = realloc (env->event_set,env->size*sizeof (ft_event_t));
   //fprintf(stderr,"reallocation of %d events at %d!!!!\n",env->size,env->event_set);
}

/*****************************************************/
int _store_event_in_environment (ft_environment_t env,int index,ft_event_t event)
{
   if (index == env->size) {
      _event_set_realloc (env);
      if (env->event_set == NULL) return EBADMEM;    
   }
   (env->event_set)[index] = event;
   return OK;
}
void _add_to_timer (ft_environment_t env,ft_thread_t thread)
{
   _add_thread_list (env->timer,thread);
}
/*****************************************************/
ft_environment_t _environment_create (void)
{
   ft_environment_t new = malloc (sizeof (struct ft_environment_t));
   if (new == NULL) return NULL;
   new->move = 0;
   new->eoi = 0;
   new->instant = 0;

   _event_set_malloc (new);
   if (NULL == new->event_set) return NULL;

   new->timer = _create_thread_list ();
   if (new->timer == NULL) return NULL;
   
   return new;
}

/*****************************************************/
static int _deadline_reached (ft_thread_t thread)
{
   ft_scheduler_t sched = _get_thread_scheduler (thread);
   ft_environment_t env = _get_scheduler_environment (sched);
   int deadline = _get_thread_deadline (thread);
   
   if (deadline > env->instant) return 0; // keep it
   if (_get_thread_status (thread) == _WAIT) _set_thread_status (thread,_READY);
   return 1; // remove it
}

static void _awake_deadline_reached (ft_environment_t env)
{
   _apply_thread_list (env->timer,_deadline_reached);
}

/*****************************************************/
void _new_instant (ft_environment_t env)
{
   env->instant++;
   env->move = 0;
   env->eoi = 0;
   _awake_deadline_reached (env); // awake threads reaching the deadline
}
