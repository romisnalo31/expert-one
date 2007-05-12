
:- include('bank2/bank_product.pl').

serves(permbank, perm).

require_document(permbank,ndfl2).
require_document(permbank,trudovaja).

minAge(permbank,20).
maxAge(permbank,98).

 	
explanation(ok_age(permbank,_),'Perm bank accepts age in bounds 20 and 98 years').
 	