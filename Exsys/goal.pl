
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

ok_insurance(Bank, House) :-
    true.
    
        

    
    