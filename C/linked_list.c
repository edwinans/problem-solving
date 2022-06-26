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

#include "linked_list.h"

#define CHECK_MALLOC(f, p)          \
  if (!p)                           \
  {                                 \
    printf("%s MALLOC ERROR\n", f); \
    return NULL;                    \
  }

#define show_bool(b) (b ? "true" : "false")

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

list last(list l)
{
  while (l->next)
    l = l->next;

  return l;
}

size_t length(list l)
{
  size_t len = 0;
  while (l)
  {
    l = l->next;
    len++;
  }

  return len;
}

// create a list of size `n` with `val` in [0...n)
list nlist(int n)
{
  list hd = make_cell(0);
  list l = hd;
  for (int i = 1; i < n; i++)
    l = next(l, i);

  return hd;
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

bool has_cycle(list l)
{
  list p1 = l, p2 = l;
  while (p1 && p2)
  {
    p1 = p1->next;
    p2 = p2->next ? p2->next->next : NULL;
    if (p1 == p2)
      return true;
  }

  return false;
}

int main(int argc, char const *argv[])
{
  list l;
  l = nlist(10);
  print_list(l);
  printf("len: %ld\n", length(l));
  printf("has_cycle: %s\n", show_bool(has_cycle(l)));
  free_list(l);

  l = nlist(5);
  last(l)->next = l->next->next;
  printf("has_cycle: %s\n", show_bool(has_cycle(l)));

  return 0;
}
