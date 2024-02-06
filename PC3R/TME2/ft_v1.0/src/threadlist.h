typedef struct thread_list_t *thread_list_t;
typedef struct thread_cell_t *thread_cell_t;
typedef int (*thread_list_map_t) (ft_thread_t);

thread_list_t  _create_thread_list      (void);
int            _add_thread_list         (thread_list_t,ft_thread_t);
void           _reset_thread_list       (thread_list_t);
void           _apply_thread_list       (thread_list_t,thread_list_map_t);
void           _trace_thread_list       (thread_list_t);
int            _get_length_thread_list  (thread_list_t);
thread_cell_t  _get_first_thread_list   (thread_list_t);
ft_thread_t    _get_content_thread_cell (thread_cell_t);
thread_cell_t  _get_next_thread_cell    (thread_cell_t);
