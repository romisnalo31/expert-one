%
% main module for Prolog expert system
%

:- use_module('loader.pl').
:- use_module('helper.pl').
    

do(load) :- do_load.
do(help) :- do_help.
do(_) :- true.
    
main:-
	greeting,
	repeat,
	write('Command > '),
	read(X),
	do(X),
	X == 'quit'.






    
    