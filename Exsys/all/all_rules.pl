

require_document(_,passport).

ok_age(_,Age) :- 
 	between(18,67,Age).

ok_citizenship(Client) :-
    citizenship(Client, russian).
    
monthly_payment(Rate, Period, Price, Payment) :-
	Payment is (Price*(Rate+100)/100)/Period.    
	
exceeds_minimum(Income, Payment) :-
    Income/3 > Payment.