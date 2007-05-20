
whyquery(Client, Question, Hist) :-
    explainWhy(Hist, Explanation),
	whyask(Client, Question, Explanation),
	!.
	
whyquery(Client, Question, Hist) :-
    explainWhy(Hist, Explanation),
    asserta(whyask(Client, Question, Explanation)).
    

explainWhy((Hist1, Hist2), (_, _)) :- 
    var(Hist1),
    var(Hist2),
    !.

explainWhy((Hist1, Hist2), Expl2) :- 
    var(Hist1),
    !,
    explainWhy(Hist2, Expl2).

explainWhy((Hist1, Hist2), Expl1) :- 
    var(Hist2),
    !,
    explainWhy(Hist1, Expl1).

explainWhy((Hist1, Hist2), (Expl1, Expl2)) :- !,
	explainWhy(Hist1, Expl1),
	explainWhy(Hist2, Expl2).

explainWhy(Goal, Explanation) :-
    whyask(Goal, Explanation),
    !.
	
explainWhy(Goal, Explanation) :-
    explanation(Goal, Explanation),
    !.

explainWhy(Goal, Goal).