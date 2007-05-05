


ask(Client, Question, Answer) :-
	known(Client, Question, Answer),    
	!.                             
								
ask(Client, Question, Answer) :-
	doask(Client, Question, Answer), 
	asserta(known(Client,Question,Answer)).

doask(Client, Question, Answer) :-
    write(Client),
    write(' ,'),
    write(Question),
    read(Answer).

confirm(Client,Question) :-
	known(Client, Question, yes),    
	!.                             
    
confirm(Client,Question) :-
	known(Client, Question, _),
	!, fail.    

confirm(Client,Question) :-
	doconfirm(Client, Question, Answer),
	asserta(known(Client,Question,Answer)),
	Answer = yes.

doconfirm(Client,Question, Answer) :-
    write(Client),
    write(' ,'),
    write(Question),
    read(Answer).


name(Client) :-
    doask(Client, 'What is your name?', Client).

lives(Client, City) :-
	ask(Client, 'Where do you live?', City).

citizenship(Client, russian) :-
    confirm(Client, 'Is you citizenship russian?').

income(Client, Income) :-
    ask(Client,'What is your monthly income in rubles?', Income).

period(Client, Months) :-
    ask(Client,'What is the period of credit in months?', Months).

age(Client, Years) :-
    ask(Client,'What is your age?', Years).

purchases(Client, House) :-
    ask(Client,'What you buy?', House).

price(House, Price) :-
    ask(House,'What is the price of house in rubles?', Price).

house_type(House, flat) :-
    confirm(House,'This is a flat?').    

   