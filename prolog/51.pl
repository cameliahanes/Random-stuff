contains([V|_], V):-!.
contains([_|T], V):-contains(T, V).


union([], [], []).

union([], L, L).

union([H|T], SET, [H|R]):-
	not(contains(SET, H)),
	union(T, SET, R).

union([H|T], SET, R):-
	member(SET, H),
	union(T, SET, R).

sets(_, 0, []):-!.

sets([H|T], K, [H|R]):-
	K1 is K - 1,
	sets(T, K1, R).
sets([_|T], K, R):-
	sets(T, K, R).

mainsets([], []).
mainsets(LIST, R):-
	findall(X, sets(LIST, 2, X), R).
