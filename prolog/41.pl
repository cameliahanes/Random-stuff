add([], []).

add([H|T], [H, 1|R]):-
	H mod 2 =:= 0,
	add(T, R).

add([H|T], [H|R]):-
	H mod 2 =\= 0,
	add(T, R).

