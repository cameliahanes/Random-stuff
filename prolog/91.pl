insert(L, E, 0, [E|L]):-!.

insert([H|T], E, INDEX, [H|R]):-
	I1 is INDEX - 1,
	insert(T, E, I1, R).

gcd(A, 0, A).

gcd(0, A, A).

gcd(A, A, A).

gcd(_, 1, 1).
	
gcd(1, _, 1).

gcd(A, B, G):-
	A > B,
	A1 is A mod B,
	gcd(A1, B, G).

gcd(A, B, G):-
	B > A,
	B1 is B mod A,
	gcd(A, B1, G).

gcdl([H], H):-!.

gcdl([H1, H2|T], R):-
	gcd(H1, H2, GCD),
	gcdl([GCD|T], R).

