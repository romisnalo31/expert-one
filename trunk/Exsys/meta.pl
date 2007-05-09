

prove(true) :- !.

prove( (Goal1, Goal2) ) :- !,
	prove(Goal1),
	prove(Goal2).

	
prove(Goal) :-
    traceable(Goal),
    !,
    write('Call:'), write(Goal),
    clause(Goal, Body),
    write(' -> '), write(Body),nl,
    prove(Body),
    write('Exit:'), write(Goal), nl.
    
prove(Goal) :- 
	call(Goal).

traceable(credit(_,_)).
traceable(ok_client(_,_)).
traceable(ok_house(_,_)).
traceable(ok_rate(_,_,_)).
traceable(ok_type(_,_)).
traceable(ok_insurance(_,_)).
traceable(ok_price(_,_)).
traceable(purchases(_,_)).
traceable(sells(_,_)).
traceable(rate(_,_)).
traceable(product_target(_,_)).
traceable(require_document(_,_)).
traceable(serves(_,_)).
traceable(exceeds_minimum(_,_)).


%traceable(ok_age(_,_)).

	    
%operational(_=_).
%operational(_ is _).
%operational(_<_).
%operational(_>_).
%operational(asserta(_)).
%operational(!).
%operational(nonvar(_)).
%operational(prove(_)).
%operational(between(_,_,_)).
