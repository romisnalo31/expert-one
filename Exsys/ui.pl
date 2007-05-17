
login(Client) :-
    write('What is your name?'),
    read(Client).


doAsk(Client, Question, Answer, Trace) :-
    write(Client),write(' ,we ask this question because:'), write(Trace),nl,
    write(Question),nl,
    read(Answer).
    
doAskWithDefault(Client, Question, Answer, Default) :-
    write(Client),
    write(' ,'),
    write(Question),write(' ['),write(Default), write('] '),nl,
    read(Answer).
