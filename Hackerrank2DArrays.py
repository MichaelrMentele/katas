# -*- coding: utf-8 -*-
"""
Created on Mon Mar  7 16:31:00 2016

@author: michaelmentele
"""

#!/bin/python3

import sys

arr = []
for arr_i in range(6):
   arr_t = [int(arr_temp) for arr_temp in input().strip().split(' ')]
   arr.append(arr_t)

rows = len(arr)
cols = len(arr[0])
num_hourglasses = 16

sums = []
for hg in range(num_hourglasses):
    for i in range(4):
        j = 0
        for j in range(4):
            temp_hg_sum = arr[i][j] + arr[i][j+1] + arr[i][j+2] + arr[i+1][j+1] + arr[i+2][j] + arr[i+2][j+1] + arr[i+2][j+2]
            sums.append(temp_hg_sum)

print(max(sums))
    #==============================================================================
# sums = []
# for i in range(len(arr)):
#     for j in range(len(arr[i])):
#         temp_sum += arr[i][j] 
#     
#==============================================================================
    
