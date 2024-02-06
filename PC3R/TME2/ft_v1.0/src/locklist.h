typedef struct lock_list_t *lock_list_t;

lock_list_t  _add_to_lock_list      (pthread_mutex_t*,lock_list_t);
lock_list_t  _remove_from_lock_list (pthread_mutex_t*,lock_list_t);
void         _unlock_all            (lock_list_t);
