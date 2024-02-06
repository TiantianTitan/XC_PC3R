int              _scheduler_well_created    (ft_scheduler_t);

ft_thread_t      _get_scheduler_self        (ft_scheduler_t);
ft_environment_t _get_scheduler_environment (ft_scheduler_t);
int              _get_scheduler_eoi         (ft_scheduler_t);
void             _set_scheduler_move        (ft_scheduler_t);
int              _get_scheduler_instant     (ft_scheduler_t);

int              _store_event               (ft_scheduler_t,int index,ft_event_t);
void             _store_in_timer            (ft_scheduler_t,ft_thread_t);

int              _register_unlink_order     (ft_thread_t);
int              _register_as_runnable      (ft_thread_t);
