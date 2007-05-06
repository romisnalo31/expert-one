% main module for expert system
:- include('goal.pl').
:- include('bank/bank_rules.pl').
:- include('all/all_rules.pl').
:- include('account.pl').
:- include('ui.pl').

:- dynamic
        answer/3, question/2, confirmation/3.

main :-
    login(Client),
    findall(Product, credit(Client, Product), Result),
    write('Credit products are:'), write(Result), nl.
    

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

    