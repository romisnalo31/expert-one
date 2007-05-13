
:- include('bank/bank_product.pl').
:- include('bank/bank_product2.pl').

serves(absolut, moscow).
explanation(serves(absolut,moscow),'Absolut bank loves Moscow').

serves(absolut, peter).
explanation(serves(absolut,peter),'Absolut bank serves Peter').

require_document(absolut,ndfl2).
require_document(absolut,trudovaja).

minAge(absolut,25).
maxAge(absolut,47).
 	
explanation(ok_age(absolut,_),'Absolut bank accepts age in bounds 25 and 47 years').
 	