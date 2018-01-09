comb(0, _, []).

comb(N, [X|T], [X|R]):-
	N > 0,
	N1 is N - 1,
	comb(N1, T, R).


comb(N, [_|T], R):-
	N > 0,
	comb(N, T, R).

main(N, X, Y):-
	findall(AUX, comb(N, X, AUX), Y),
	write(AUX).
