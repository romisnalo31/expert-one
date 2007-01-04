:- module(loader, [do_load/1, do_load/0]).
% Module for rules loading

do_load :-
    write('Enter file name in single quotes (ex. ''know/birds.nkb''.): '),
    read(F),
	do_load(F).

do_load(X) :-
    write('Loading '),write(X),nl,
    reconsult(X).