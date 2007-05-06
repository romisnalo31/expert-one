

require_document(_,passport).

ok_age(_,Age) :- 
    known(Age),
 	between(18,67,Age).

ok_citizenship(Client) :-
    citizenship(Client, russian).
    
monthly_payment(Rate, Period, Price, Payment) :-
    known(Price),
    known(Rate),
    known(Period),
	Payment is (Price*(Rate+100)/100)/Period.    
	
exceeds_minimum(Income, Payment) :-
    known(Income),
    known(Payment),
    Income/3 > Payment.