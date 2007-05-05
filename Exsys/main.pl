% main module for expert system
:- include('goal.pl').
:- include('bank/bank_rules.pl').
:- include('all/all_rules.pl').
:- include('questions.pl').

:- dynamic
        known/3.

main :-
    name(Client),
    findall(Product, credit(Client, Product), Result),
    write('Credit products are:'), write(Result), nl.
    
restart :-
    name(Client),
    retractall(known(Client,_,_)),
    write(Client), write(' cleared data').

	
