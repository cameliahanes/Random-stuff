concatenate([], L, L).

concatenate([H|T], L, [H|R]):-
	concatenate(T, L, R).


substitute([], _, _, []).

substitute([H|T], ELEM, LIST, [H|R]):-
	ELEM =\= H,
	substitute(T, ELEM, LIST, R).

substitute([H|T], ELEM, LIST, R):-
	ELEM =:= H,
	substitute(T, ELEM, LIST, AUX),
	concatenate(LIST, AUX, R).
