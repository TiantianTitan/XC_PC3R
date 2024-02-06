/* Fair threads automata API for C                                     */
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

#ifndef _AUTOMATON_H
#define _AUTOMATON_H

/****************************************************/
typedef void (*automaton_t)(ft_thread_t);

ft_thread_t ft_automaton_create (ft_scheduler_t,automaton_t,executable_t,void *args);

#define DEFINE_AUTOMATON(name)    _DEFINE_AUTOMATON(name)
#define BEGIN_AUTOMATON           _BEGIN_AUTOMATON        
#define STATE(n)                  _STATE(n)
#define END_AUTOMATON             _END_AUTOMATON

#define GOTO_NEXT                 _GOTO_NEXT
#define GOTO(n)                   _GOTO(n) 
#define IMMEDIATE(n)              _IMMEDIATE(n)

#define SELF                      _SELF
#define SET_LOCAL(data)           _SET_LOCAL(data)
#define LOCAL                     _LOCAL
#define ARGS                      _ARGS
#define RETURN_CODE               _RETURN_CODE

#define AWAIT(event)              _AWAIT(event)
#define AWAIT_N(event,delay)      _AWAIT_N(event,delay)
#define GENERATE(event)           _GENERATE(event) 
#define GENERATE_VALUE(event,val) _GENERATE_VALUE(event,val)
#define GET_VALUE(event,n,result) _GET_VALUE(event,n,result)
#define STAY(delay)               _STAY_INST(delay)
#define JOIN(thread)              _JOIN(thread)
#define JOIN_N(thread,delay)      _JOIN_N(thread,delay)

/**********************************************
  internal definitions: should not be used
***********************************************/

#define _DEFINE_AUTOMATON(name)\
   void name (ft_thread_t _self)\

#define _BEGIN_AUTOMATON\
      while (1) {\
         int state = _get_thread_state (_self);\
         switch (state)\
         {	    
      
#define _STATE(n)\
            case n: _SET_STATE(n);

#define _END_AUTOMATON\
            default: _SET_STATE(-1); \
                     _terminate (_self);\
                     return;\
         }\
      }

#define _GOTO_NEXT    {_SET_STATE(state+1); _SET_STATUS(_DONE);}
#define _GOTO(n)      {_SET_STATE(n); _SET_STATUS(_DONE);}
#define _IMMEDIATE(n) {_SET_STATE(n); break;}

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

int   _get_thread_state         (ft_thread_t);
void  _set_thread_state         (ft_thread_t,int state);
void  _set_thread_status        (ft_thread_t,int status);
void* _get_thread_local         (ft_thread_t);
void  _set_thread_local         (ft_thread_t,void *data);
void* _get_thread_args          (ft_thread_t);
void  _set_thread_return_code   (ft_thread_t,int code);

void  _terminate                (ft_thread_t);

/****************************************************/
#define _SET_STATE(n)    _set_thread_state  (_self,n)
#define _SET_STATUS(s)  {_set_thread_status (_self,s); return;}

/****************************************************/
#define _DEADLINE         _get_thread_deadline   (_self)
#define _SET_DEADLINE(n)  _set_thread_deadline   (_self,n)
#define _CURRENT_INSTANT  _get_scheduler_instant (sched)

/****************************************************/
#define _STAY_INST(delay)\
{\
   int ret = _automaton_stay (_self,delay);\
   if (ret == _STAY) return;\
   else _set_thread_return_code (_self,ret);\
}

/****************************************************/
#define _AWAIT(event)\
{\
   int ret = _automaton_await (_self,event);\
   if (ret == _STAY) return;\
   else _set_thread_return_code (_self,ret);\
}

#define _AWAIT_N(event,delay)\
{\
   int ret = _automaton_await_n (_self,event,delay);\
   if (ret == _STAY) return;\
   else _set_thread_return_code (_self,ret);\
}

/****************************************************/
#define _GENERATE(event)           _automaton_generate       (_self,event)
#define _GENERATE_VALUE(event,val) _automaton_generate_value (_self,event,val)

/****************************************************/
#define _GET_VALUE(event,index,result)\
{\
   int ret = _automaton_get_value (_self,event,index,result);\
   if (ret == _STAY) return;\
   else _set_thread_return_code (_self,ret);\
}

/****************************************************/
#define _JOIN(thread)\
{\
   int ret = _automaton_join (_self,thread);\
   if (ret == _STAY) return;\
   else _set_thread_return_code (_self,ret);\
}

#define _JOIN_N(thread,delay)\
{\
   int ret = _automaton_join_n (_self,thread,delay);\
   if (ret == _STAY) return;\
   else _set_thread_return_code (_self,ret);\
}

#endif	/* _AUTOMATON_H */
