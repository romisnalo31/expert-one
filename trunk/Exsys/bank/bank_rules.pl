
:- include('bank/bank_product.pl').
:- include('bank/bank_product2.pl').

serves(absolut, moscow).
serves(absolut, peter).

require_document(absolut,ndfl2).
require_document(absolut,trudovaja).

ok_age(absolut,Age) :- 
    !,
    known(Age),
 	between(25,47,Age).