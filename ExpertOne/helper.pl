:- module(helper, [do_help/0, greeting/0]).
% Module for rules loading

greeting :-
    write('Welcome to Expert One'),nl.
    
do_help :-
     write('Enter a command followed by dot (.).'), nl.