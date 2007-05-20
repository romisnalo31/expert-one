

require_document(_,passport).

ok_age(Bank,Age) :- 
    known(Age),
    minAge(Bank, Min),
    maxAge(Bank, Max),
    Age >= Min,
    Age < Max.

explanation(ok_age(_,_),'Age must be between min and max for most banks to accept').

whyask(age(_,_),'Age is important for qualification for credit').
whyask(ok_client(_,_),'Bank must pre-qualify person').
whyask(credit(_,_),'You apply for credit').

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
    
explanation(exceeds_minimum(_, _), 'Payment must not exceed 1/3 from sallary after taxes').    

explanation(serves(Bank, City),Explanation) :-
    serves(Bank, City), !,
	swritef(Explanation, 'Bank %w works in %w',[Bank, City]).
	
explanation(serves(Bank, City),Explanation) :-
	swritef(Explanation, 'Bank %w does not works in %w',[Bank, City]).
	