

require_document(_,passport).

ok_age(Bank,Age) :- 
    known(Age),
    minAge(Bank, Min),
    maxAge(Bank, Max),
    Age >= Min,
    Age < Max.

explanation(ok_age(_,_),'Age must be between min and max for most banks to accept').

ok_citizenship(Client) :-
    citizenship(Client, Country),
    Country = russian.
    
monthly_payment(Rate, Period, Price, Payment) :-
    known(Price),
    known(Rate),
    known(Period),
	Payment is (Price*(Rate+100)/100)/Period.    
	
exceeds_minimum(Income, Payment) :-
    known(Income),
    known(Payment),
    Income/3 > Payment.