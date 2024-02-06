typedef struct broadcast_list_t *broadcast_list_t;

broadcast_list_t _add_to_broadcast_list (ft_event_t,
                                     int pure,
				     void *value,
				     broadcast_list_t);

void _destroy_broadcast_list  (broadcast_list_t);
void _generate_broadcast_list (broadcast_list_t);
