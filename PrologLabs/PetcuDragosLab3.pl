% IsPrime(el,divisor) = { True, divisor*divisor > el
%						  False, el % divisor == 0
%						  False, el < 2 == 0 
%						  IsPrime(El,divisor+2), otherwise }
% IsPrime(El-int,Divisor-int)
% (i,i)
isItPrime(2,_).
isItPrime(El,Divisor) :- El > 2, mod(El,2) =\= 0,Divisor*Divisor > El,!.
isItPrime(El,Divisor) :- El > 2, mod(El,2) =\= 0, mod(El,Divisor)=\=0, NextDivisor is Divisor+2,isItPrime(El,NextDivisor).
% verifyPrime(E - int)
% (i)
verifyPrime(E) :- isItPrime(E,3).
% InsertPrimeInList(l1..ln) = {  [], n = 0
% 								 l1 U l1 U InsertPrime(l2..ln), IsPrime(l1)
% 								 l1 U InsertPrime(l2..ln), otherwise }
% InsertPrimeInList(L-list,R-list)
% (i,o)
insertPrimeInList([],[]).
insertPrimeInList([H|L],R) :- verifyPrime(H),!, insertPrimeInList(L,R1), R2 = [H|R1], R = [H|R2].
insertPrimeInList([H|L],R) :- insertPrimeInList(L,R1), R = [H|R1].

% InsertPrimeInHetList(l1..ln) = {  [], n = 0
% 								 	InsertPrimeInList(l1) U InsertPrime(l2..ln), IsList(l1)
% 								 	l1 U InsertPrime(l2..ln), otherwise }
% InsertPrimeInHetList(L-list,R-list)
% (i,o)
insertPrimeInHetList([],[]).
insertPrimeInHetList([H|L],R) :- is_list(H),!, insertPrimeInHetList(L,R1),insertPrimeInList(H,R2), R = [R2|R1].
insertPrimeInHetList([H|L],R) :- insertPrimeInHetList(L,R1), R = [H|R1].