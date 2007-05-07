
:- include('bank2/bank_product.pl').

serves(permbank, perm).

require_document(permbank,ndfl2).
require_document(permbank,trudovaja).

ok_age(permbank,Age) :- 
    !,
    known(Age),
 	between(50,98,Age).