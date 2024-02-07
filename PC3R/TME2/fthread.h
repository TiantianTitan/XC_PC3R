/* fair threads API for C                                               */
/* Copyright (C) 2002 Frederic Boussinot (Frederic.Boussinot@inria.fr)  */
/*                                                                      */
/* This program is free software; you can redistribute it and/or        */
/* modify it under the terms of the GNU Library General Public License  */
/* as published by the Free Software Foundation; either version 2       */
/* of the License, or (at your option) any later version.               */
/*                                                                      */
/* This program is distributed in the hope that it will be useful,      */
/* but WITHOUT ANY WARRANTY; without even the implied warranty of       */
/* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the        */
/* GNU Library General Public License for more details.                 */

#ifndef _FT_THREAD_H
#define _FT_THREAD_H

#include <pthread.h>

/******** types ****************/
typedef struct ft_event_t       *ft_event_t;
typedef struct ft_thread_t      *ft_thread_t;
typedef struct ft_scheduler_t   *ft_scheduler_t;

typedef void (*ft_executable_t) (void*);
typedef void (*ft_automaton_t)  (ft_thread_t);

/******** return codes ****************/
#define OK         0 // like for pthread: 0 means OK
#define EBADMEM    1 // not enough memory
#define ETIMEOUT   2 // timeout expired
#define ENEXT      3 // no value generated during last intant
#define EBADLINK   4 // bad linking to a scheduler
#define EBADCREATE 5 // bad creation

/* creation of schedulers, threads, and events */
ft_scheduler_t ft_scheduler_create (void);
ft_thread_t    ft_thread_create    (ft_scheduler_t,ft_executable_t runnable,ft_executable_t cleanup,void *args);
ft_thread_t    ft_automaton_create (ft_scheduler_t,ft_automaton_t,ft_executable_t cleanup,void *args);
ft_event_t     ft_event_create     (ft_scheduler_t);

/* scheduler starting */
int ft_scheduler_start             (ft_scheduler_t);

/* orders given to schedulers */
int ft_scheduler_stop              (ft_thread_t);
int ft_scheduler_suspend           (ft_thread_t);
int ft_scheduler_resume            (ft_thread_t);
int ft_scheduler_broadcast         (ft_event_t);
int ft_scheduler_broadcast_value   (ft_event_t,void *value);

/* instructions executed by threads */
int ft_thread_generate             (ft_event_t);
int ft_thread_generate_value       (ft_event_t,void *value);

int ft_thread_cooperate            (void);
int ft_thread_cooperate_n          (int num);

int ft_thread_join                 (ft_thread_t);
int ft_thread_join_n               (ft_thread_t,int timeout);

int ft_thread_await                (ft_event_t);
int ft_thread_await_n              (ft_event_t,int timeout);
int ft_thread_select               (int length,ft_event_t *array,int *mask);
int ft_thread_select_n             (int length,ft_event_t *array,int *mask,int delay);

int ft_thread_get_value            (ft_event_t,int num,void **result);

int ft_thread_link                 (ft_scheduler_t);
int ft_thread_unlink               (void);

ft_thread_t    ft_thread_self      (void);
ft_scheduler_t ft_thread_scheduler (void);

/* termination of main */
void ft_exit (void);

/* ft locks */
int ft_thread_mutex_lock            (pthread_mutex_t*);
int ft_thread_mutex_unlock          (pthread_mutex_t*);

/* pthread */
pthread_t ft_pthread                (ft_thread_t);

/************ macros for automata **********************/
#define AUTOMATON(name)                      _AUTOMATON(name)
#define DEFINE_AUTOMATON(name)               _DEFINE_AUTOMATON(name)
#define BEGIN_AUTOMATON                      _BEGIN_AUTOMATON        
#define END_AUTOMATON                        _END_AUTOMATON

#define GOTO(num)                            _GOTO(num) 
#define GOTO_NEXT                            _GOTO_NEXT
#define IMMEDIATE(num)                       _IMMEDIATE(num)
#define RETURN                               _THE_END

#define SELF                                 _SELF
#define SET_LOCAL(data)                      _SET_LOCAL(data)
#define LOCAL                                _LOCAL
#define ARGS                                 _ARGS
#define RETURN_CODE                          _RETURN_CODE

#define STATE(num)                           _STATE(num)
#define STATE_AWAIT(num,event)               _STATE(num) _AWAIT(event)
#define STATE_AWAIT_N(num,event,n)           _STATE(num) _AWAIT_N(event,n)
#define STATE_GET_VALUE(num,event,n,result)  _STATE(num) _GET_VALUE(event,n,result)
#define STATE_STAY(num,n)                    _STATE(num) _STAY_INST(n)
#define STATE_JOIN(num,thread)               _STATE(num) _JOIN(thread)
#define STATE_JOIN_N(num,thread,n)           _STATE(num) _JOIN_N(thread,n)
#define STATE_SELECT(num,len,array,mask)     _STATE(num) _SELECT(len,array,mask)
#define STATE_SELECT_N(num,len,array,mask,n) _STATE(num) _SELECT_N(len,array,mask,n)

/**********************************************
  internal definitions: should not be used
***********************************************/
#define _AUTOMATON(x) void x (ft_thread_t)

#define _DEFINE_AUTOMATON(name)\
   void name (ft_thread_t _self)\

#define _BEGIN_AUTOMATON\
      while (1) {\
         int state = _get_thread_state (_self);\
if (state > 1000) {fprintf(stderr,"%d.",state); abort();}\
         switch (state)\
         {	    
      
#define _STATE(n)\
            case n: _SET_STATE(n);

#define _END_AUTOMATON\
            default: _THE_END\
         }\
      }

#define _GOTO_NEXT    {_SET_STATE(state+1); _SET_STATUS(_DONE);}
#define _GOTO(n)      {_SET_STATE(n); _SET_STATUS(_DONE);}
#define _IMMEDIATE(n) {_SET_STATE(n); break;}
#define _THE_END      {_SET_STATE(-1); _terminate (_self); return;}

/****************************************************/
#define _SELF            _self
#define _SET_LOCAL(data) _set_thread_local (_self,(void*)data)
#define _LOCAL           _get_thread_local (_self)
#define _ARGS            _get_thread_args  (_self)
#define _RETURN_CODE     _get_thread_return_code (_self)

/****************************************************/
/****************************************************/
#define _READY      0 // ready to run
#define _BLOCKED    2 // waiting to be reexecuted during the same instant
#define _DONE       3 // nothing to be done for current instant
#define _TERMINATED 4 // nothing to be done in the future
#define _SUSPENDED  5 // suspended, waiting to be resumed
#define _WAIT       6 // waiting for an event to be generated
#define _STAY       7 // automaton stays in the same state

/****************************************************/
int   _automaton_stay           (ft_thread_t self,int delay);
int   _automaton_await          (ft_thread_t self,ft_event_t);
int   _automaton_await_n        (ft_thread_t self,ft_event_t,int delay);
int   _automaton_generate       (ft_thread_t self,ft_event_t);
int   _automaton_generate_value (ft_thread_t self,ft_event_t,void* val);
int   _automaton_get_value      (ft_thread_t self,ft_event_t,int index,void **result);
int   _automaton_join           (ft_thread_t self,ft_thread_t thread);
int   _automaton_join_n         (ft_thread_t self,ft_thread_t thread,int delay);
int   _automaton_select         (ft_thread_t self,int length,ft_event_t *,int *mask);
int   _automaton_select_n       (ft_thread_t self,int length,ft_event_t *,int *mask,int delay);

int   _get_thread_state         (ft_thread_t);
void  _set_thread_state         (ft_thread_t,int state);
void  _set_thread_status        (ft_thread_t,int status);
void* _get_thread_local         (ft_thread_t);
void  _set_thread_local         (ft_thread_t,void *data);
void* _get_thread_args          (ft_thread_t);
int   _get_thread_return_code   (ft_thread_t);
void  _set_thread_return_code   (ft_thread_t,int code);

ft_scheduler_t _get_thread_scheduler   (ft_thread_t);

void  _terminate                (ft_thread_t);

int   _get_scheduler_eoi        (ft_scheduler_t);
void  _set_scheduler_move       (ft_scheduler_t);

/****************************************************/
#define _SET_STATE(n)    _set_thread_state  (_self,n)
#define _SET_STATUS(s)  {_set_thread_status (_self,s); return;}

/****************************************************/
#define _DEADLINE         _get_thread_deadline   (_self)
#define _SET_DEADLINE(n)  _set_thread_deadline   (_self,n)
#define _CURRENT_INSTANT  _get_scheduler_instant (sched)

/****************************************************/
#define _STAY_OR_PASS(ret)\
  {int b = ret; if (b == _STAY) return; else _set_thread_return_code (_self,b);}

#define _STAY_INST(delay)               _STAY_OR_PASS(_automaton_stay      (_self,delay))
#define _AWAIT(event)                   _STAY_OR_PASS(_automaton_await     (_self,event))
#define _AWAIT_N(event,delay)           _STAY_OR_PASS(_automaton_await_n   (_self,event,delay))
#define _GET_VALUE(event,index,result)  _STAY_OR_PASS(_automaton_get_value (_self,event,index,result))
#define _JOIN(thread)                   _STAY_OR_PASS(_automaton_join      (_self,thread))
#define _JOIN_N(thread,delay)           _STAY_OR_PASS(_automaton_join_n    (_self,thread,delay))
#define _SELECT(len,array,mask)         _STAY_OR_PASS(_automaton_select    (_self,len,array,mask))
#define _SELECT_N(len,array,mask,delay) _STAY_OR_PASS(_automaton_select_n  (_self,len,array,mask,delay))

#endif	/* _FT_THREAD_H */
