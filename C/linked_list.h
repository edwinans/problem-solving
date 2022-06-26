#ifndef LINKED_LIST
#define LINKED_LIST

typedef struct list
{
  int val;
  struct list *next;
} * list;

list make_cell(int);
list next(list, int);
void print_list(list);
void free_list(list);

#endif