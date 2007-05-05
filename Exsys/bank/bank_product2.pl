
sells(absolut, absolut_product2).

rate(absolut_product2,13).

ok_price(absolut_product2, Price) :-
    Price < 5000000,
    Price > 100000.

product_target(absolut_product2, flat).

product_target(absolut_product2, house).