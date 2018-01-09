count_occurences([], _, 0).

count_occurences([H|T], H, COUNTER):-
	count_occurences(T, H, CNT),
	COUNTER is CNT + 1.

count_occurences([_|T], V, COUNT):-
	count_occurences(T, V, COUNT).


remove_fst3([], _, [], 0).

remove_fst3(_, _, _, COUNTER):-
	COUNTER >= 3,
	halt.

remove_fst3([H|T], V, [H|R], COUNTER):-
	H =\= V,
	remove_fst3(T, V, R, COUNTER).

remove_fst3([H|T], V, R, COUNTER):-
	H =:= V,
	remove_fst3(T, V, R, CNT),
	COUNTER is CNT + 1.
