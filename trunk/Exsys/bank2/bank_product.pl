
sells(permbank, permbank_product1).

rate(permbank_product1,11.5).

ok_price(permbank_product1, Price) :-
    known(Price),
    Price < 10000000,
    Price > 100000.

product_target(permbank_product1, flat).
