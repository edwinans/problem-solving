#!/usr/bin/python3
"""
Edwin A
28/01/2024
https://leetcode.com/problems/generate-parentheses/

With functional programming flavor
"""

import sys
from typing import List
def readstr(): return sys.stdin.readline().strip()
def readint(): return int(readstr())


def readints(): return map(int, readstr().split())


def check_par(x, size):
    check = 0
    for i in range(size):
        if check < 0:
            return False
        if x & (1 << i):  # i-th bit is equal to 1 -> ')'
            check += 1
        else:
            check -= 1

    return check == 0


def gen_pars(n: int) -> List[str]:
    res = []
    n <<= 1
    for x in range(1 << n):
        if check_par(x, n):
            res.append(x)

    res = list(map(lambda i:
              ''.join(map(lambda x: ')' if x == '1' else '(', format(i, f"0{n}b"))),
                res)
                )
    return res


def main():
    print(gen_pars(3))  # ['((()))', '(()())', '()(())', '(())()', '()()()']


main()
