suma([], SC, SC).

suma([H|T], SC, S):-
	SC1 is SC + H,
	suma(T, SC1, S).

comb([H|T], [H|TR]):-
	comb(T, TR).

comb([_|T], TR):-
	comb(T, TR).

onesol(L, S, RL):-
	comb(L, RL),
	suma(RL, 0, SM),
	SM =:= S.

allsols(L, SUM, RES):-
	findall(AUX, onesol(L, SUM, AUX), RES).

