

prove(true, _) :- !.

prove( (Goal1, Goal2), (Explanation1 , Explanation2) ) :- !,
	prove(Goal1, Explanation1),
	prove(Goal2, Explanation2).
	
prove(Goal,  Explanation) :-
    traceable(Goal),
    !,
%   write('Call:'), write(Goal),
    clause(Goal, Body),
    tryExplain(Goal, Explanation),
%    nl,write(' -> '), write(Body),nl,
    prove(Body,Explanation).
%    write('Exit:'), write(Goal), nl.
  
prove(Goal,_) :- 
	call(Goal).

tryExplain(Goal, Explanation) :-
    explanation(Goal, Explanation), 
    !.
 
tryExplain(_,_).
    
explanation(ok_rate(Client, House, Product), Product+' Rate ! is suitable for you'+Client+' to buy '+House).
explanation(ok_type(House, Product), House+' house type matches '+Product).

traceable(credit(_,_)).
traceable(ok_client(_,_)).
traceable(ok_house(_,_)).
traceable(ok_rate(_,_,_)).
traceable(ok_type(_,_)).
traceable(ok_insurance(_,_)).
traceable(ok_price(_,_)).
traceable(ok_citizenship(_)).
traceable(purchases(_,_)).
traceable(sells(_,_)).
traceable(rate(_,_)).
traceable(lives(_,_)).
traceable(age(_,_)).
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
