:- multifile explanation/2.


%
% solve(-Goal)
% Find the solution for Goal, 
% tracing  rules execution for "whyask" questions
% 

solve(Goal) :-
    solve(Goal, _).
    
solve(true, _) :- !.

solve( (Goal1, Goal2), (Explanation1 , Explanation2) ) :- !,
	solve(Goal1, Explanation1),
	solve(Goal2, Explanation2).

solve(query(Client, Question, Answer),  Explanation) :- !,
    write('Asking '),write(Question),write(' because '),write(Explanation),nl,
    query(Client, Question, Answer).
	
solve(Goal,  Explanation) :-
    traceable(Goal),
    !,
    clause(Goal, Body),
    explainWhy(Goal, Explanation),
    solve(Body, Explanation).
  
solve(Goal,_) :- 
	call(Goal).
	
explainWhy(Goal, Explanation) :-
    explanation(Goal, Explanation).
%    , 
%    !,
%    write(Goal),write(' ? ->'), write(Explanation),nl.
 
explainWhy(_,_).


%
% prove_not(+Goal, -Explanation)
% Explanation is why Goal is not unified
%

prove_not(true,_) :-
	!.

prove_not( (Goal1, Goal2), (Explanation1 , Explanation2) ) :-
	prove_not(Goal1, Explanation1),
	prove_not(Goal2, Explanation2), 
	!.

prove_not(Goal,_) :- 
	prove(Goal, _), 
	!.
	
prove_not(Goal, Explanation) :- 
	explanation(Goal, Explanation), 
	!.
	
prove_not(Goal, Explanation) :-
    traceable(Goal),
    clause(Goal, Body),
%    write('fail:'),write(Goal),write('->'),write(Body),nl,
    prove_not(Body, Explanation).

prove_not(Goal, _) :-
	traceable(Goal).  

%
% prove(+Goal, -Explanation)
% Explanation is why Goal is unified
%
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
    explanation(Goal, Explanation).
 
tryExplain(_,_).
   
traceable(credit(_,_)).
traceable(ok_client(_,_)).
traceable(ok_house(_,_)).
traceable(ok_rate(_,_,_)).
traceable(ok_type(_,_)).
traceable(ok_insurance(_,_)).
traceable(ok_price(_,_)).
traceable(ok_age(_,_)).
traceable(ok_citizenship(_)).
traceable(purchases(_,_)).
traceable(sells(_,_)).
traceable(rate(_,_)).
traceable(lives(_,_)).
traceable(age(_,_)).
traceable(known(_)).
traceable(product_target(_,_)).
traceable(require_document(_,_)).
traceable(serves(_,_)).
traceable(monthly_payment(_,_)).
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
