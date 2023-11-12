#!/usr/bin/python3
"""
Ahmadreza M
Edwin A
12/11/2023
https://leetcode.com/problems/count-sub-islands/
"""

import sys
from typing import List
def readstr(): return sys.stdin.readline().strip()
def readint(): return int(readstr())


def readints(): return map(int, readstr().split())


class Solution:
    def countSubIslands(self, grid1: List[List[int]], grid2: List[List[int]]) -> int:
        n, m = len(grid1), len(grid1[0])

        marks = [[False for _ in range(m)] for _ in range(n)]

        ans = 0
        for i in range(n):
            for j in range(m):
                if marks[i][j] is False and grid2[i][j] == 1:
                    if self.dfs(i, j, marks, grid2, grid1) is True:
                        ans += 1
        return ans

    def dfs(self, i, j, marks, grid2, grid1):
        marks[i][j] = True

        u = True
        for x, y in [(1, 0), (-1, 0), (0, 1), (0, -1)]:
            ii = i + x
            jj = j + y

            if 0 <= ii < len(grid1) and 0 <= jj < len(grid1[0]) and grid2[ii][jj] == 1 and marks[ii][jj] is False:
                if self.dfs(ii, jj, marks, grid2, grid1) is False:
                    u = False

        if u is False or grid1[i][j] == 0:
            return False
        return True


def main():
    grid1 = [[1, 1, 1, 0, 0],
             [0, 1, 1, 1, 1],
             [0, 0, 0, 0, 0],
             [1, 0, 0, 0, 0],
             [1, 1, 0, 1, 1]]

    grid2 = [[1, 1, 1, 0, 0],
             [0, 1, 1, 1, 1],
             [0, 1, 0, 0, 0],
             [1, 0, 1, 1, 0],
             [0, 1, 0, 1, 0]]

    S = Solution()
    print(S.countSubIslands(grid1, grid2))


main()
