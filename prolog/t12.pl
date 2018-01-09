eliminate([], _, []).

eliminate([H|T], N, [H|R]):-
	not(is_list(H)),
	eliminate(T, N, R).

eliminate([H|T], N, [H|R]):-
	is_list(H),
	length(H, LH),
	LH  mod 2 =:= 1,
	eliminate(T, N, R).

eliminate([H|T], N, R):-
	is_list(H),
	length(H, LH),
	LH mod 2 =:= 0,
	N1 is N - 1,
	eliminate(T, N1, R).
	
