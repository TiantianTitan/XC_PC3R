#include "fthread_internal.h"

struct thread_cell_t
{
  ft_thread_t            content;
  struct thread_cell_t  *next;
};


struct thread_list_t
{
  int            length;
  thread_cell_t  first;
  thread_cell_t  last;
};

/***********************************************************/
int _get_length_thread_list  (thread_list_t list)
{
   return list->length;
}

thread_cell_t _get_first_thread_list (thread_list_t list)
{
   return list->first;
}

ft_thread_t _get_content_thread_cell (thread_cell_t cell)
{
   return cell->content;
}

thread_cell_t _get_next_thread_cell (thread_cell_t cell)
{
   return cell->next;
}

/***********************************************************/
// creation
thread_list_t _create_thread_list (void)
{
   thread_list_t res = malloc (sizeof (struct thread_list_t));
   res->length = 0;
   res->first = NULL;
   res->last = NULL;
   return res;
}

// add a new thread as last element
int _append_thread_list (thread_list_t list,ft_thread_t thread)
{
   thread_cell_t new = malloc (sizeof (struct thread_cell_t));
   if (NULL == new) return EBADMEM;
   new->content = thread;
   new->next = NULL;
   
   if (0 == list->length){
      list->first = list->last = new;
   }else{
      list->last->next = new;
      list->last = new;
   }

   list->length++;

   return OK;
}

// reset the list
void _reset_thread_list (thread_list_t list)
{
   if (list->length != 0) {
      thread_cell_t cell = list->first;
      while (cell != NULL) {
	 thread_cell_t next = cell->next;
	 free (cell);
	 cell = next;
      }
   }
   list->length = 0;
   list->first = NULL;
   list->last = NULL;
}

// is a thread contained in the list ?
int _contains_thread_list (thread_list_t list,ft_thread_t thread)
{
   if (list->length != 0) {
      thread_cell_t cell = list->first;
      while (cell != NULL) {
	 thread_cell_t next = cell->next;
         if (cell->content == thread) return 1;
	 cell = next;
      }
   }
   return 0;
}

// add a new thread if not already present in the list
int _add_thread_list (thread_list_t list,ft_thread_t thread)
{
   if (_contains_thread_list (list,thread)) return OK;
   return _append_thread_list (list,thread);
}

// apply a function f to all threads in the list.
// f(thread) returns 1 = remove the thread, 0 keep it
void _apply_thread_list (thread_list_t list,thread_list_map_t f)
{
   thread_cell_t cell, previous = NULL;
   if (list->length == 0) return;
   cell = list->first;

   while  (cell != NULL) {
      if (f (cell->content)) { // remove cell
	 list->length--;
	 if (previous == NULL) { // cell first item
	    list->first = cell->next;
	    free (cell);
	    cell = list->first;
	 } else if (cell == list->last) { // cell last item
            previous->next = NULL;
	    list->last = previous;
 	    free (cell);
	    return;
	 } else {
	    previous->next = cell->next;
	    free (cell);
	    cell = previous->next;
	 }
      } else { // keep cell
	 previous = cell;
	 cell = cell->next;
      }
   }
}

// trace function
void _trace_thread_list (thread_list_t list)
{
   fprintf (stderr, "[ ");
   if (list->length != 0) {
      thread_cell_t cell = list->first;
      while (cell != NULL) {
	 thread_cell_t next = cell->next;
	 _trace_thread (cell->content);
	 cell = next;
      }
   }
   fprintf (stderr, "]\n");
}

