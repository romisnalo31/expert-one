
sells(absolut, absolut_product1).

rate(absolut_product1,11.5).

ok_price(absolut_product1, Price) :-
    known(Price),
    Price < 10000000,
    Price > 100000.

explanation(ok_price(absolut_product1, _),'Price is allowed between 100000 and 10000000').

product_target(absolut_product1, flat).

product_target(absolut_product1, house).