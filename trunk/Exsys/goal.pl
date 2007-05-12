
:- multifile 
	sells/2, rate/2, ok_price/2, product_target/2, 
	require_document/2, ok_age/2, serves/2, exceeds_minimum/2,
	minAge/2, maxAge/2.
	
credit(Client, Product) :-
    purchases(Client, House),
    sells(Bank, Product),
    ok_client(Client, Bank),
    ok_house(House, Product),
    ok_insurance(Bank, House),
    ok_rate(Client, House, Product).
    
ok_client(Client,Bank) :-
    ok_citizenship(Client),
    lives(Client, City),
    serves(Bank, City),
    age(Client, Age),
    ok_age(Bank, Age).
    
ok_house(House, Product) :-
    price(House, Price),
    ok_type(House, Product),
    ok_price(Product, Price).
    
ok_rate(Client, House, Product) :-
    income(Client, Income),
    period(Client, Period),
    rate(Product, Rate),
    price(House, Price),
    monthly_payment(Rate, Period, Price, Payment),
    exceeds_minimum(Income, Payment).
    
ok_type(House, Product) :-
    product_target(Product, Type),
    house_type(House, Type).

ok_insurance(_, _) :-
    true.
    
        

    
    