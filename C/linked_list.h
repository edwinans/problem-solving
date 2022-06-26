#ifndef LINKED_LIST
#define LINKED_LIST

#include "stdlib.h"
#include "stdio.h"
#include "stdbool.h"

typedef struct list *list;

list make_cell(int);
list next(list, int);
void print_list(list);
list last(list);
size_t length(list);
list nlist(int);
void free_list(list);
bool has_cycle(list);

#endif