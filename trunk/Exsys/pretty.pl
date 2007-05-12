
printExlanation((E1, E2)) :-
    var(E1), 
    var(E2),
    !.

printExlanation((E1, E2)) :-
    var(E2),
    not(var(E1)),
    !,
    printExlanation(E1).
    
printExlanation((E1, E2)) :-
    not(var(E2)),
    var(E1),
    !,
    printExlanation(E2).
    
printExlanation((E1, E2)) :-
    !,
    printExlanation(E1),
    printExlanation(E2).
	
	
printExlanation(Explanation) :-
    write(Explanation),nl.
