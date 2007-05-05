% main module for expert system
:- include('goal.pl').
:- include('bank/bank_rules.pl').
:- include('all/all_rules.pl').
:- include('questions.pl').

:- dynamic
        known/3.

main :-
    retractall(known(aleksey,_,_)),
    findall(Product, credit(aleksey, Product), Result),
    write('Credit products are:'), write(Result), nl.
    
main :-
    write('No answer found'), nl.
	
