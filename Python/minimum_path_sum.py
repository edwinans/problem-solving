#!/usr/bin/python3
"""
Edwin A
22/02/2024
https://leetcode.com/problems/minimum-path-sum/
"""

import sys
from math import inf
from typing import List


def readstr(): return sys.stdin.readline().strip()
def readint(): return int(readstr())


def readints(): return map(int, readstr().split())


def dfs(i, j, m, n, x, grid, dist):
    if i >= m or j >= n:
        return

    if x + grid[i][j] < dist[i][j]:
        dist[i][j] = x + grid[i][j]

    dfs(i + 1, j, m, n, dist[i][j], grid, dist)
    dfs(i, j + 1, m, n, dist[i][j], grid, dist)


def min_path_sum_dfs(grid: List[List[int]]) -> int:
    m, n = len(grid), len(grid[0])
    dist = [[inf for _ in range(n)] for _ in range(m)]
    dfs(0, 0, m, n, 0, grid, dist)

    return dist[m-1][n-1]


def min_path_sum_dp(grid: List[List[int]]) -> int:
    m, n = len(grid), len(grid[0])
    dist = [[inf for _ in range(n)] for _ in range(m)]
    dist[0][0] = grid[0][0]

    for i in range(m):
        for j in range(n):
            if i < m - 1 and dist[i][j] + grid[i+1][j] < dist[i+1][j]:
                dist[i+1][j] = dist[i][j] + grid[i+1][j]

            if j < n - 1 and dist[i][j] + grid[i][j+1] < dist[i][j+1]:
                dist[i][j+1] = dist[i][j] + grid[i][j+1]

    return dist[m-1][n-1]


def main():
    grid1 = [[1, 3, 1], [1, 5, 1], [4, 2, 1]]  # 7
    grid2 = [[1, 2, 3], [4, 5, 6]]  # 12
    grid3 = [[7, 1, 3, 5, 8, 9, 9, 2, 1, 9, 0, 8, 3, 1, 6, 6, 9, 5],
             [9, 5, 9, 4, 0, 4, 8, 8, 9, 5, 7, 3, 6, 6, 6, 9, 1, 6],
             [8, 2, 9, 1, 3, 1, 9, 7, 2, 5, 3, 1, 2, 4, 8, 2, 8, 8],
             [6, 7, 9, 8, 4, 8, 3, 0, 4, 0, 9, 6, 6, 0, 0, 5, 1, 4],
             [7, 1, 3, 1, 8, 8, 3, 1, 2, 1, 5, 0, 2, 1, 9, 1, 1, 4],
             [9, 5, 4, 3, 5, 6, 1, 3, 6, 4, 9, 7, 0, 8, 0, 3, 9, 9],
             [1, 4, 2, 5, 8, 7, 7, 0, 0, 7, 1, 2, 1, 2, 7, 7, 7, 4],
             [3, 9, 7, 9, 5, 8, 9, 5, 6, 9, 8, 8, 0, 1, 4, 2, 8, 2],
             [1, 5, 2, 2, 2, 5, 6, 3, 9, 3, 1, 7, 9, 6, 8, 6, 8, 3],
             [5, 7, 8, 3, 8, 8, 3, 9, 9, 8, 1, 9, 2, 5, 4, 7, 7, 7],
             [2, 3, 2, 4, 8, 5, 1, 7, 2, 9, 5, 2, 4, 2, 9, 2, 8, 7],
             [0, 1, 6, 1, 1, 0, 0, 6, 5, 4, 3, 4, 3, 7, 9, 6, 1, 9]]
    # 85

    print(min_path_sum_dp(grid3))


main()
