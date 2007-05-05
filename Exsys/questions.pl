


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

lives(aleksey, City) :-
	ask(aleksey, 'Where do you live?', City).

citizenship(aleksey, russian) :-
    confirm(aleksey, 'Is you citizenship russian?').

income(aleksey, Income) :-
    ask(aleksey,'What is your monthly income in rubles?', Income).

period(aleksey, Months) :-
    ask(aleksey,'What is the period of credit in months?', Months).

age(aleksey, Years) :-
    ask(aleksey,'What is your age?', Years).

purchases(aleksey, house).

price(house, Price) :-
    ask(aleksey,'What is the price of house in rubles?', Price).

house_type(house, flat) :-
    confirm(aleksey,'You want to buy a flat?').    

   