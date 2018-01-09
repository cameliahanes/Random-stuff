merge_sort([], []).

merge_sort([H], [H]):-!.

merge_sort(L, R):-
	split(L, LEFT, RIGHT),
	merge_sort(LEFT, RL),
	merge_sort(RIGHT, RR),
	merge(RL, RR, R).

merge([], B, B).

merge(B, [], B).

merge([HA|TA], [HB|TB], [HA|R]):-
	HA <= HB,
	merge(TA, [HB|TB], R).

merge([HA|TA], [HB|TB], [HB|R]):-
	HB < HA,
	merge([HA|TA], TB, R).

split([], [], []).

split(LIST, LEFT, RIGHT):-
	split(LIST, [], LEFT, RIGHT).



