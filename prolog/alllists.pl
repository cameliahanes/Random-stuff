subset([], []).

subset([H|T], [H|R]):-
	subset(T, R).

subset([_|T], R):-
	subset(T, R).

is_sorted([]):-!.

is_sorted([_]):-!.

is_sorted([H1, H2|T]):-
	H1 <= H2,
	is_sorted([H2|T]).

process([], []).

process(L, K):-
	subset(L, K),
	is_sorted(K).

allsolutions(L, R):-
	findall(AUX, process(L, AUX), R).
	write(Aux).



