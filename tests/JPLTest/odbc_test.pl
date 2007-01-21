
open_db :-
        odbc_connect('db2', _,[ 
                       alias(db2),
                       user(studio),
                       password(studio),
                       open(once)
                     ]).

domain(Name) :-
        odbc_query(db2,
                   'SELECT (name) FROM domain',
                   row(Name)).

 