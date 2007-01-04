:- module(loader, [do_load/0]).
% Module for rules loading

do_load :-
	do_load('/home/studnev/workspace/ExpertOne/know/birds.nkb').

do_load(X) :-
    write('Loading '),write(X),nl,
    reconsult(X).