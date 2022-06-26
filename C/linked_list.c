/**
 * @file linked_list.c
 * @author Edwin A
 * @brief linked_list structure with utility functions
 * @version 0.1
 * @date 2022-06-26
 *
 * @copyright Copyright (c) 2022
 *
 */

#include "stdlib.h"
#include "stdio.h"

#define CHECK_MALLOC(f, p)          \
  if (!p)                           \
  {                                 \
    printf("%s MALLOC ERROR\n", f); \
    return NULL;                    \
  }

typedef struct list
{
  int val;
  struct list *next;
} * list;

// returns a pointer to a new cell with `val` as the value
list make_cell(int val)
{
  list l = (list)malloc(sizeof(list));
  CHECK_MALLOC("make_cell", l);
  l->val = val;
  l->next = NULL;
  return l;
}

// returns a pointer to the next cell of `l` with `val` as the value
list next(list l, int val)
{
  list next_cell = make_cell(val);
  l->next = next_cell;

  return next_cell;
}

/*
  prints `l`
  precondition: `l` don't have a cycle
*/
void print_list(list l)
{
  printf("[");
  for (list cur = l; cur; cur = cur->next)
  {
    printf("%d%s", cur->val, cur->next ? ", " : "");
  }
  printf("]\n");
}

/* free the memory of all cells of `l`*/
void free_list(list l)
{
  list next_cell;
  while (l)
  {
    next_cell = l->next;
    free(l);
    l = next_cell;
  }
}

int main(int argc, char const *argv[])
{
  list hd = make_cell(0);
  list last = next(next(next(hd, 1), 2), 3);
  print_list(hd);
  free_list(hd);

  return 0;
}
