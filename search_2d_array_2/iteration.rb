# Write an efficient algorithm that searches for a value in an m x n matrix.
# This matrix has the following properties:
#
# Integers in each row are sorted in ascending from left to right.
# Integers in each column are sorted in ascending from top to bottom.
# For example,
#
# Consider the following matrix:
#
# [
#   [1,   4,  7, 11, 15],
#   [2,   5,  8, 12, 19],
#   [3,   6,  9, 16, 22],
#   [10, 13, 14, 17, 24],
#   [18, 21, 23, 26, 30]
# ]
#
# [
#   [1,   4,  7, 11, 15],
#   [2,   5,  8, 12, 19*],
#   [3,   6,  9*, 16, 22*],
#   [10, 13, 14, 17*, 24],
#   [18*, 21*, 23*, 26, 30*]
# ]
# Given target = 5, return true.
#
# Given target = 20, return false.
#
# Problem Exploration
#
# if we choose a number at point i, j
# we know that all values of a < i will be smaller
# and all values of b < j will be smaller
# if we choose 9 and the value is smaller, we can throw away all i rows
# and all j columns below and to the right of 9.
#
# More Formally
#
# we choose values:
#   i = min_i + (max - min) / 2 where i is the row index
#   j = min_j + (max - min) / 2 where j is the column index
# if the target is less than the value at i, j
#   new max_j = j
#   new max_i = i
# if the target is more than the value at i, j:
#   for all rows <= i, remove all columns <= j
# or rather:
#   new_min_j = j + 1
#   new_min_i = i + 1
