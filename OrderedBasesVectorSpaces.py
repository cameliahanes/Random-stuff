'''
Created on 15 dec. 2016

@author: Camelia
'''

import numpy

def dett(mat, lst):
    l = []
    for i in range(1, len(mat)):
        l.append(lst[mat[i]])
    return l


def backtr1_generate_vectors(index, n, lst, vect):
    if n == index:

        lst.append(vect)
        return
    for i in range(0, 2):
        vect[index] = i
        backtr1_generate_vectors(index+1, n, lst, vect[:])
            
def generate_combinations_backtr2(g_list, n, k, lst):
    if k > n:
        #print(dett(g_list, lst))
        if numpy.linalg.det(dett(g_list, lst)) != 0:
            print(dett(g_list, lst))
            return
    else:
        for i in range(g_list[n-1] + 1, len(lst)):
            g_list[k] = i
            generate_combinations_backtr2(g_list[:], n, k+1, lst)


def main():
    
    g_list = []
    vect = []

    n = int(input("Enter the dimension of the vectors: "))
    for i in range(0, n):
        vect.append(0)

    lst = []
    for i in range(0, n+1):
        g_list.append(0)
    g_list[0] = -1
    backtr1_generate_vectors(0, n, lst, vect)
    #print(lst)
    generate_combinations_backtr2(g_list, n, 1, lst)


if __name__ == '__main__':
    main()