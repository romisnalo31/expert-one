
login(Client) :-
    write('What is your name?'),
    read(Client).


ask(Client, Question, Answer) :-
    write(Client),
    write(' ,'),
    write(Question),
    findall(Why,whyask(Client,Question,Why),Reasons),
    write(Reasons),
    read(Answer).
    
ask(Client, Question, Answer, Default) :-
    MyQuestion = Question + Default,
    ask(Client, MyQuestion, Answer).
