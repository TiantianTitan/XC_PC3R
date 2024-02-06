typedef struct ft_environment_t *ft_environment_t;

void              _new_instant                (ft_environment_t);
ft_environment_t  _environment_create         (void);

int               _get_environment_eoi        (ft_environment_t);
void              _set_environment_eoi        (ft_environment_t,int b);

int               _get_environment_move       (ft_environment_t);
void              _set_environment_move       (ft_environment_t,int b);

int               _get_environment_instant    (ft_environment_t);

int               _store_event_in_environment (ft_environment_t,int index,ft_event_t);

void              _add_to_timer               (ft_environment_t,ft_thread_t);
int               _timer_size                 (ft_environment_t);
