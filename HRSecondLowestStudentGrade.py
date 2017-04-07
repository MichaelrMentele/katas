# -*- coding: utf-8 -*-
"""
Created on Wed Mar  9 06:48:11 2016

@author: michaelmentele
"""

def secondLowest(students):
    ''' Returns the second lowest grade in an [['name', grade]...n] array of arrays'''
    students = sortStudents(students)
    return students[1]
    
def swap(s1, s2):
    temp = s1
    s1 = s2
    s2 = temp
    
    return s1, s2
    
    
def sortStudents(students):
    loop = len(students)
    
    for i in range(loop-1):        
        for j in range(loop-1):
            if students[j][1] > students[j+1][1]:
                students[j][1], students[j+1][1] = swap(students[j][1], students[j+1][1])
            
    return students
            

#==============================================================================
# students = [['john', 10.0], ['jacob', 6.0], ['jingle', 40.3], ['jam', 1.0]]
# print('This is the return: ' + str(sortStudents(students)))
#==============================================================================
n = int(input())

students = []
for i in range(n):
    name = input()
    grade = int(input())
    student = [name,grade]
    students.append(student)
    
print(secondLowest(students))

