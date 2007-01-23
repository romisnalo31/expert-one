:- use_module(library(jpl)).

jpl_simple :-
	jpl_new( 'SimpleClass', [], F),
	jpl_call( F, just, [], _), 
	nl.


% this directive runs the above demo

:- jpl_simple.

