""""
12) Consider the natural number n (n<=10) and the natural numbers 𝑎1, …, 𝑎𝑛. Determine all the
possibilities to insert between all numbers 𝑎1, …, 𝑎𝑛 the operators + and – such that by evaluating the
expression the result is positive.
"""

def first(x):
    return 0

def consistent(x, n):
    return len(x) <= n

def is_solution(listt, x, n):
    if len(x) < n:
        return False
    sum = listt[0]
    for i in range(1, len(listt)):
        if x[i-1] == 0:
            sum = sum - listt[i]
        else:
            sum = sum + listt[i]
    return sum > 0

def display_solution(listt, x):
    for i in range(len(listt) - 1):
        operator = "- " if x[i] == 0 else "+ "
        print(listt[i], operator, end ="")
    print(listt[-1])

def next_element(x):
    if x[len(x) - 1] == 1:
        return None
    return x[len(x) - 1] + 1

def backtracking_recursive(listt, x, n):
    element = first(x)
    x.append(element)
    while element != None:
        x[len(x) - 1] = element
        if consistent(x, n):
            if is_solution(listt, x, n):
                display_solution(listt, x)
            else:
                backtracking_recursive(listt, x[:], n)
        element = next_element(x)

def initial_value():
    return -1

def backtracking_iterative(list, n):
    """"
    :iterative function to develop the algorithm
    """
    x = [initial_value()]
    while len(x) > 0:
        element = next_element(x)
        while element != None:
            x[len(x) - 1] = element
            if consistent(x, n):
                if is_solution(list, x, n):
                    display_solution(list, x)
                else:
                    x.append(initial_value())
                    break
            element = next_element(x)
        if element is None: x = x[:-1]

def backtracking(list, n):
    print("Recursive: ")
    backtracking_recursive(list, [], n)
    print("Iterative: ")
    backtracking_iterative(list, n)

listt = [2,4,7,1]
backtracking(listt, len(listt)-1)