#include "fthread_internal.h"

/**************************************/
struct broadcast_list_t {
  ft_event_t               event;
  int                      pure;
  void                     *value;
  struct broadcast_list_t  *next;
};

/**************************************/
broadcast_list_t _add_to_broadcast_list (ft_event_t event,
                                     int pure,
				     void *value,
				     broadcast_list_t list)
{
   broadcast_list_t new = malloc (sizeof (struct broadcast_list_t));
   if(new == NULL) return NULL;
   new->event  = event;
   new->pure   = pure;
   new->value  = value;
   new->next   = list;
   return new;
}

void _destroy_broadcast_list (broadcast_list_t list)
{
   while(list != NULL) {
      broadcast_list_t next = list->next;
      free(list);
      list = next;
   }
}

void _generate_broadcast_list (broadcast_list_t list)
{
   while(list != NULL){
      if (list->pure) _event_generate (list->event);
      else _event_generate_value (list->event,list->value);
      list = list->next;
   }
}
