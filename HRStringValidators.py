# -*- coding: utf-8 -*-
"""
Created on Mon Mar  7 17:10:18 2016

@author: michaelmentele
"""


a = input()
functions = [str.isalnum, str.isalpha, str.isdigit, str.islower, str.isupper]

for function in functions:
    istrue = False
    for letter in a:
        if function(letter) == True:
            istrue = True
    print(istrue)