min([MIN], MIN).
min([H|T], H):-
	min(T, MIN),
	H < MIN, !.
min([_|T], MIN):-
	min(T, MIN).

delete_first([], _, []).

delete_first([H|T], H, T):-!.

delete_first([H|T], V, [H|R]):-
	delete_first(T, V, R).


main(L, R):-
	min(L, MIN),
	delete_first(L, MIN, R).
