
sells(permbank, permbank_product1).

explanation(sells(permbank, permbank_product1),'Perm bank sells Perm product').

explanation(sells(permbank, _),'Perm bank sells only Perm product').

rate(permbank_product1,11.5).

ok_price(permbank_product1, Price) :-
    known(Price),
    Price < 10000000,
    Price > 100000.

product_target(permbank_product1, flat).
