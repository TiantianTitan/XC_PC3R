#include "fthread_internal.h"
#include <sched.h>

/******************************************/
struct ft_scheduler_t
{
  ft_thread_t              self;
   
  thread_list_t            thread_table;
  thread_list_t            to_run;
  thread_list_t            to_stop;
  thread_list_t            to_suspend;
  thread_list_t            to_resume;
  thread_list_t            to_unlink;
  broadcast_list_t         to_broadcast;
  
  pthread_mutex_t          sleeping;
  pthread_cond_t           awake;

  ft_environment_t         environment;

  int                      well_created; // == FT_MAGIC if creation is OK
};

/******************************************/
int _scheduler_well_created (ft_scheduler_t sched)
{
   return sched->well_created == FT_MAGIC;
}

ft_environment_t _get_scheduler_environment (ft_scheduler_t sched)
{
   return sched->environment;
}

ft_thread_t _get_scheduler_self (ft_scheduler_t sched)
{
   return sched->self;
}

int _get_scheduler_eoi (ft_scheduler_t sched)
{
   return _get_environment_eoi (sched->environment);
}

void _set_scheduler_move (ft_scheduler_t sched)
{
   _set_environment_move (sched->environment,1);
}

int _get_scheduler_instant (ft_scheduler_t sched)
{
   return _get_environment_instant (sched->environment);
}

/******************************************/
int _store_event (ft_scheduler_t sched,int index,ft_event_t event)
{
   return _store_event_in_environment (sched->environment,index,event);
}

void _store_in_timer (ft_scheduler_t sched,ft_thread_t thread)
{
   _add_to_timer (sched->environment,thread);
}

/******************************************/
static int _can_run (ft_thread_t thread)
{
   int status = _get_thread_status (thread);
   return status != _SUSPENDED && status != _TERMINATED && status != _WAIT;
}

static int _is_fireable (ft_thread_t thread)
{
   int status = _get_thread_status (thread);
   return status == _READY || status == _BLOCKED;
}

/******************************************************/
#define FOR_ALL_THREADS \
   thread_list_t table = sched->thread_table;\
   thread_cell_t cell  = _get_first_thread_list (table);\
   while (cell != NULL){\
      ft_thread_t thread = _get_content_thread_cell (cell);

#define END_FOR_ALL \
      cell = _get_next_thread_cell (cell);\
   }
/******************************************************/
static int _all_done (ft_scheduler_t sched)
{
   FOR_ALL_THREADS
   int status = _get_thread_status (thread);            
   if (_can_run (thread) && status != _DONE) return 0;
   END_FOR_ALL
   return 1;
}

static int _all_blocked_or_done (ft_scheduler_t sched)
{
   FOR_ALL_THREADS
   int status = _get_thread_status (thread);      
   if (_can_run (thread) && status != _DONE && status != _BLOCKED) return 0;
   END_FOR_ALL
   return 1;
}

/******************************************************/
static void _fire_all_threads (ft_scheduler_t sched)
{
   FOR_ALL_THREADS
   if (_is_fireable (thread)){
      if (!_is_automaton (thread)) {
        //fprintf(stderr,"scheduler fires thread %ld\n",thread);
	_transmit_token (sched->self,thread);
        //fprintf(stderr,"scheduler returns from thread %ld\n",thread);
      } else {
	//fprintf(stderr,"scheduler fires automaton %ld\n",(long)thread);
        _run_as_automaton (thread);
      }
   }
   END_FOR_ALL
}

/******************************************************/
static void _next_step (ft_scheduler_t sched)
{
   FOR_ALL_THREADS
   int status = _get_thread_status (thread);           
   if (status == _BLOCKED) _set_thread_status (thread,_READY);
   END_FOR_ALL
}

static int _micro_step (ft_scheduler_t sched)
{
   _set_environment_move (sched->environment,0);
   _fire_all_threads (sched);
   if (_all_done (sched)) return 1;
   if (_all_blocked_or_done (sched)){
      if (_get_environment_move (sched->environment) == 0)
	 _set_environment_eoi (sched->environment,1);
      _next_step (sched);
   }
   return 0;
}

/******************************************************/
static int _somebody_must_be_continued (ft_scheduler_t sched)
{
   FOR_ALL_THREADS
   int status = _get_thread_status (thread);           
   if (status == _READY) return 1;
   END_FOR_ALL
   return 0;
}

static int _something_to_do (ft_scheduler_t sched)
{
   return
      _timer_size (sched->environment) > 0
   || _somebody_must_be_continued (sched)
   || _get_length_thread_list (sched->to_run) > 0
   || _get_length_thread_list (sched->to_resume) > 0
   || _get_length_thread_list (sched->to_unlink) > 0
   || sched->to_broadcast != NULL;
}

/******************************************************/
static void _sleep_if_nothing_to_do (ft_scheduler_t sched)
{
   _PTH_LOCK(sched->sleeping);
   while (!_something_to_do (sched)){
      //fprintf(stderr,"scheduler %ld falls asleep..\n",(long)sched->self);
      _PTH_WAIT(sched->awake,sched->sleeping);
      //fprintf(stderr,"scheduler %ld awakes..\n",(long)sched->self);
   }
   _PTH_UNLOCK(sched->sleeping);
}

static void _awake (ft_scheduler_t sched)
{
   _PTH_LOCK(sched->sleeping);
   //fprintf (stderr,"awake scheduler thread %ld\n",(long)sched->self);
   _PTH_NOTIFY(sched->awake,sched->sleeping);
   _PTH_UNLOCK(sched->sleeping);  
}

/******************************************************/
static void _incorporate_orders (ft_scheduler_t sched);

static void _init_instant (ft_scheduler_t sched)
{
   _sleep_if_nothing_to_do (sched);
   _new_instant (sched->environment);
   _incorporate_orders (sched);
   //_trace_instant (sched);
}

static void _finish_instant (ft_scheduler_t sched)
{
   FOR_ALL_THREADS
   int status = _get_thread_status (thread);           
   if (status == _DONE) _set_thread_status (thread,_READY);
   END_FOR_ALL
}

static void _one_instant (ft_scheduler_t sched)
{
   _init_instant (sched);
   while (!_micro_step (sched)){/* nothing */}
   _finish_instant (sched);
}

/*****************************************************/
static void* _scheduler_behavior (void *arg)
{
   ft_scheduler_t sched = (ft_scheduler_t)arg;

   while (1) {
      _one_instant (sched);
      sched_yield ();
   } 
   return NULL;
}

/*****************************************************/
ft_scheduler_t ft_scheduler_create (void)
{
  pthread_mutex_t sleeping;
  pthread_cond_t awake;

  ft_scheduler_t sched = malloc (sizeof (struct ft_scheduler_t));
  if (sched == NULL) return NULL;

  sched->self = _make_thread ();

  if (NULL == (sched->thread_table = _create_thread_list ())) return NULL;
  if (NULL == (sched->to_run       = _create_thread_list ())) return NULL;
  if (NULL == (sched->to_stop      = _create_thread_list ())) return NULL;
  if (NULL == (sched->to_suspend   = _create_thread_list ())) return NULL;
  if (NULL == (sched->to_resume    = _create_thread_list ())) return NULL;
  if (NULL == (sched->to_unlink    = _create_thread_list ())) return NULL;  
  sched->to_broadcast   = NULL;

  pthread_mutex_init (&sleeping,NULL);
  pthread_cond_init  (&awake,NULL);
  
  sched->sleeping    = sleeping;
  sched->awake       = awake;

  sched->environment = _environment_create ();
  if (sched->environment != NULL) sched->well_created = FT_MAGIC;
  
  return sched;
}

int ft_scheduler_start (ft_scheduler_t sched)
{
   int res;
   pthread_t pth;

   _VERIFY_SCHEDULER_CREATION(sched);

   pth = ft_pthread (sched->self);

   res = pthread_create (&pth,NULL,_scheduler_behavior,sched);
   //if (res == 0) fprintf (stderr,"scheduler %d started\n",(int)sched->self);
   return res;
}

/*****************************************************/
static void _trace_instant (ft_scheduler_t sched)
{
   fprintf (stderr,"\n>>> instant %d ",_get_scheduler_instant(sched));
   _trace_thread_list (sched->thread_table);
   fprintf (stderr,": ");
}

/*******************************************************/
#define ORDER(set)\
 {\
    int res;\
    ft_scheduler_t sched = _get_thread_scheduler (thread);\
    ft_thread_t s = sched->self;\
    _lock_thread (s);\
    res = _add_thread_list (sched->set,thread);\
    _unlock_thread (s);\
    _awake (sched);\
    return res;\
 }

int _register_as_runnable (ft_thread_t thread)
{
   _VERIFY_THREAD_CREATION(thread);
   ORDER(to_run);
}

int ft_scheduler_stop (ft_thread_t thread)
{
   _VERIFY_THREAD_CREATION_AND_LINK (thread);
   ORDER(to_stop);
}

int ft_scheduler_suspend (ft_thread_t thread)
{
   _VERIFY_THREAD_CREATION_AND_LINK (thread);
   ORDER(to_suspend);
}
 
int ft_scheduler_resume (ft_thread_t thread)
{
   _VERIFY_THREAD_CREATION_AND_LINK (thread);
   ORDER(to_resume);
}

int _register_unlink_order (ft_thread_t thread)
{
   _VERIFY_THREAD_CREATION_AND_LINK (thread);
   ORDER(to_unlink);
}

/*******************************************************/
static void _broadcast_to_generate (ft_scheduler_t sched)
{
   if (sched->to_broadcast != NULL){
      _generate_broadcast_list (sched->to_broadcast);
      _destroy_broadcast_list(sched->to_broadcast);
      sched->to_broadcast = NULL;
   }
}

/*******************************************************/
static int _broadcast (ft_event_t event,int pure,void *val){
   int res;
   ft_scheduler_t sched;

   _VERIFY_EVENT_CREATION (event);

   sched = _get_event_scheduler (event);
  
   _lock_thread (sched->self);
   sched->to_broadcast = _add_to_broadcast_list (event,pure,val,sched->to_broadcast);
   res = (sched->to_broadcast == NULL) ? EBADMEM : OK;
   _unlock_thread (sched->self);
   _awake (sched); // awake scheduler which is possibly sleeping  
   return res;
}

int ft_scheduler_broadcast (ft_event_t event){
   return _broadcast(event,1,NULL);
}

int ft_scheduler_broadcast_value (ft_event_t event,void *val){
   return _broadcast(event,0,val);
}

/******************************************/
#define INIT_PROCESSING(set)\
  thread_list_t table = sched->set;\
  thread_cell_t cell  = _get_first_thread_list (table);\
  if (_get_length_thread_list (table) != 0) {\
    while(cell != NULL){\
       ft_thread_t thread = _get_content_thread_cell (cell);    

#define END_PROCESSING(set)\
       cell = _get_next_thread_cell (cell);\
    }\
    _reset_thread_list (table);\
  }\
      
/******************************************/
static void _resume (ft_thread_t thread)
{
   int status = _get_thread_status (thread);
   if (status == _SUSPENDED || status == _WAIT) {
      _set_thread_status (thread,_READY);
   }
}

static void _run_processing (ft_scheduler_t sched)
{
   INIT_PROCESSING (to_run)
      _set_thread_status (thread,_READY);
      _set_thread_scheduler (thread,sched);
      _add_thread_list (sched->thread_table,thread);
   END_PROCESSING (to_run)
}

static void _stop_processing (ft_scheduler_t sched)
{
   INIT_PROCESSING (to_stop)
      _stop_thread (thread);
      _resume (thread);                     // resume
   END_PROCESSING (to_stop)
}

static void _suspend_processing (ft_scheduler_t sched)
{
   INIT_PROCESSING (to_suspend)
      _set_thread_status (thread,_SUSPENDED); // suspend
   END_PROCESSING (to_suspend)
}

static void _resume_processing (ft_scheduler_t sched)
{
   INIT_PROCESSING (to_resume)
      _resume (thread);                     // resume
   END_PROCESSING (to_resume)
}

static void _unlink_processing (ft_scheduler_t sched)
{
   INIT_PROCESSING (to_unlink)
      _set_thread_scheduler (thread,NULL);  // unlink
   END_PROCESSING (to_unlink) 
}

/********************************************/
// perform unlinking and remove terminated and unlinked threads
static int _purge (ft_thread_t thread)
{
  if (_get_thread_scheduler (thread) == NULL) {
     _give_token_to (thread); // real unlinking
     return 1; // remove
  }
  if (_get_thread_status (thread) == _TERMINATED) {
     return 1; // remove
  }
  return 0; // keep it
}

static void _incorporate_orders (ft_scheduler_t sched)
{
  _lock_thread (sched->self);
  
  _run_processing (sched);
  _broadcast_to_generate (sched);
  _stop_processing (sched);
  _unlink_processing (sched);
  _apply_thread_list (sched->thread_table,_purge);
  _resume_processing (sched);
  _suspend_processing (sched); // suspend prefered to resume

  _unlock_thread (sched->self);
}
