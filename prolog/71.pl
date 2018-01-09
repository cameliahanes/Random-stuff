member([V|_], V):-!.
member([_|T], V):-
	member(T, V).

%intersection(+SET1:list, +SET2:list, -R:List)
%intersection(l1..ln, k1..km) = [], n == 0
%			      = l1 + intersection(l2..ln, k1..km), member(k1..km, k1)
%			      = intersection(l2..ln, k1..km), otherwise

intersection([], _, []).
intersection([H|T], SET, [H|R]):-
	member(SET, H),
	intersection(T, SET, R),!.
intersection([_|T], SET, R):-
	intersection(T, SET, R).



create(M, N, []):-
	M > N.

create(M, N, [M|R]):-
	M1 is M + 1,
	create(M1, N, R).

