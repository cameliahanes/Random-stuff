on(Head, [Head|Tail]).

on(Head, [Elem|Tail]):-
	on(Head, Tail).

