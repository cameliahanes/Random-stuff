product([], _, CARRY, [CARRY|_]).

product([H], X, _, R):-
	R is H * X.

product([H|T], X, CARRY, [DIGIT|R]):-
	product(T, X, NEWCARRY, R),
	PRODUCT is X * H + CARRY,
	DIGIT is PRODUCT mod 10,
	NEWCARRY is PRODUCT div 10.

findmax([], MAX, MAX).

findmax([H|T], MAX0, MAX):-
	MAX1 is max(H, MAX0),
	findmax(T, MAX1, MAX).

listmax([H|T], MAX):-
	findmax(T, H, MAX).

replace_sublists([H|T], [H|R]):-
	not(is_list(H)),
	replace_sublists(T, R).

replace_sublists([H|T], [MAX|R]):-
	is_list(H),
	listmax(T, MAX),
	replace_sublists(T, R).

