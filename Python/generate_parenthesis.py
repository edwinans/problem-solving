#!/usr/bin/python3
"""
Edwin A
28/01/2024
https://leetcode.com/problems/generate-parentheses/
"""

import sys
from typing import List
def readstr(): return sys.stdin.readline().strip()
def readint(): return int(readstr())


def readints(): return map(int, readstr().split())


def check_gen_par(x, size):
    r = ""
    check = 0
    for i in range(size):
        if check < 0:
            return None
        if x & (1 << i):  # i-th bit is equal to 1 -> '('
            check += 1
            r += '('
        else:
            check -= 1
            r += ')'
    if check == 0:
        return r


def gen_pars(n: int) -> List[str]:
    res = []
    n <<= 1
    for x in range(1 << n):
        r = check_gen_par(x, n)
        if r:
            res.append(r)
    return res


def main():
    gen_pars(3)  # ['((()))', '(()())', '()(())', '(())()', '()()()']


main()
