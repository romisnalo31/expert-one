

known(Value) :-
    nonvar(Value).


query(Client, Question, Answer) :-
    answer(Client, Question, Answer),
    !.

query(Client, Question, _) :-
    question(Client, Question,_),
    !.

query(Client, Question, _) :-
    asserta(question(Client, Question,'Why we ask the question? Must be here..')).

confirm(Client, Question, _, Answer) :-
    answer(Client, Question, Answer),
    !.

confirm(Client, Question, Default, Answer) :-
    confirmation(Client, Question, Default),
    !,
    Answer = Default.

confirm(Client, Question, Default, Answer) :-
    asserta(confirmation(Client, Question, Default)),
    Answer = Default.


income(Client, Income) :-
    query(Client,'What is your monthly income in rubles?', Income).
    
citizenship(Client, Country) :-
    confirm(Client, 'Is you citizenship russian?', russian, Country).
    
lives(Client, City) :-
	confirm(Client, 'Where do you live?', moscow, City).

period(Client, Months) :-
    query(Client,'What is the period of credit in months?', Months).

age(Client, Years) :-
    query(Client,'What is your age?', Years).

purchases(Client, House) :-
    House = Client.


price(House, Price) :-
    purchases(Client, House),
    query(Client,'What is the price of house in rubles?', Price).

house_type(House, Type) :-
    purchases(Client, House),
    confirm(Client,'What is the house type?', flat, Type).    
    
    
    
    