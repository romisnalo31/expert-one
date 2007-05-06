
login(Client) :-
    write('What is your name?'),
    read(Client).


ask(Client, Question, Answer) :-
    write(Client),
    write(' ,'),
    write(Question),
    read(Answer).
    
ask(Client, Question, Answer, Default) :-
    MyQuestion = Question + Default,
    ask(Client, MyQuestion, Answer).
