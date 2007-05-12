:- op( 500, xfy, <== ).
% main module for expert system
:- include('meta.pl').
:- include('goal.pl').
:- include('bank/bank_rules.pl').
:- include('bank2/bank_rules.pl').
:- include('all/all_rules.pl').
:- include('account.pl').
:- include('ui.pl').

:- include('pretty.pl').

:- dynamic
        answer/3, question/2, confirmation/3.

do :-
    login(Client),
    repeat,
	    propose(Client),
	    ask(Client).

prove :-
    login(Client),
	    prove(credit(Client, Product), Explanation),
	    write(Product),write(' recommended because:'),nl,
	    printExlanation(Explanation).
    	


ask(Client) :-
    question(Client,Question),
	ask(Client, Question),
	!,
	fail.

ask(Client) :-
    confirmation(Client,Question,_),
	confirm(Client, Question),
	!,
	fail.
	
ask(_) :-
    write('No questions'), nl,
    true.	
    
propose(Client) :-
    credit(Client, _),
    !,
    findall(Product, credit(Client, Product), Result),
    nl,write('Credit products are:'), write(Result), nl,nl.
    
propose(_) :-
    write('No matching credit products found.'), nl,
    true.
    
main :-
    login(Client),
    findall(Product, credit(Client, Product), Result),
    write('Credit products are:'), write(Result),nl.
    

ask :-
	login(Client),
	findall(Question, ask(Client, Question), Result),
	write('Asked:'), write(Result), nl.

confirm :-
	login(Client),
	findall(Question, confirm(Client, Question), Result),
	write('Confirmed:'), write(Result), nl.


confirm(Client, Question) :-
    confirmation(Client, Question, Default),
	not(answer(Client, Question, _)),
	ask(Client, Question, Asnwer, Default),
	asserta(answer(Client, Question, Asnwer)).

ask(Client, Question) :-
    question(Client, Question),
	not(answer(Client, Question, _)),
	ask(Client, Question, Asnwer),
	asserta(answer(Client, Question, Asnwer)).
    
restart :-
    login(Client),
    retractall(answer(Client,_,_)),
    retractall(confirmation(Client,_,_)),
    retractall(question(Client,_)),
    write(Client), write(' cleared data').

