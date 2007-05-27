:- encoding(utf8).
	
ол(лдвыавы, олдку).
ол(лдвыавы, олдку).
ол(лдвыавы, олдку).
ол(лдвыавы, олдку).
ол(лдвыавы, олдку).

likes(X,Y) :-
    ол(X,Y).

anna_data :-
        odbc_connect('anna', _,
                     [ user(studnev),
                       password(kuska265),
                       alias(anna),
                       open(once)
                     ]),
	odbc_query(anna, 'set names utf8'),
	odbc_query(anna, 'set character_set_client=utf8,character_set_connection=utf8,character_set_database=utf8,character_set_results=utf8').


cur(Name) :-
	anna_data,
        odbc_query(anna,
                   'SELECT * FROM ref_currency',
                    Name,[ types([integer, default])]
		  ).

fetch :- fetch('Руб').

fetch(Id) :-
	anna_data,
	odbc_set_connection(anna, cursor_type(static)),
	odbc_prepare(anna,
                     'SELECT * FROM ref_currency where name=?',
                     [default],
                     Statement,
		     [ fetch(fetch)]),
        odbc_execute(Statement, [Id]),
        fetch(Statement, next).

fetch(Statement, Options) :-
        odbc_fetch(Statement, Row, Options),
        (   Row == end_of_file
        ->  true
        ;   writeln(Row),
            fetch(Statement, Options)
        ).
