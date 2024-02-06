#include "fthread_internal.h"

/**************************************/
struct lock_list_t {
   pthread_mutex_t       *lock;
   struct lock_list_t    *next;
};

/**************************************/
lock_list_t _add_to_lock_list (pthread_mutex_t *lock,lock_list_t list)
{
  lock_list_t new = malloc (sizeof(struct lock_list_t));
  if (NULL == new) return NULL;
  new->lock = lock;
  new->next = list;
  return new;
}

lock_list_t _remove_from_lock_list (pthread_mutex_t *lock,lock_list_t list)
{
   lock_list_t initial = list, previous;
   if (list == NULL) return NULL;
   if (list->lock == lock) return list->next;
   previous = list;
   while(NULL != (list = list->next)){
      if (list->lock == lock) {
	 previous->next = list->next;
	 free (list);
	 return initial;
      }
      previous = list;
   }
   return initial;
}

void _unlock_all (lock_list_t list)
{
   while(list != NULL){
      lock_list_t next = list->next;
      pthread_mutex_unlock (list->lock);
      free (list);
      list = next;
   }
}
