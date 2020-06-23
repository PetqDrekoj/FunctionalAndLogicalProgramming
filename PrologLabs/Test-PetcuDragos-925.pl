% cmmdc(E1,E2) = 
% 		E1, E2 = 0
% 		cmmdc(E2,E1%E2), otherwise
% (int, int,int)
% (i,i,o)
cmmdc(E1,0,E1).
cmmdc(E1,E2,E3) :- R is mod(E1,E2), cmmdc(E2,R,E3).

% getCmmmcList(l1..ln,E)
% 			E, n = 0
% 			getCmmmcList(l2..ln,(E*l1)/cmmdc(E,l1)), otherwise
% (List, int, int)
% (i,o,o)
getCmmmcList([],R,R).
getCmmmcList([H|T],L,R) :- cmmdc(H,L,L1),L2 is H*L/L1, getCmmmcList(T,L2,R).

%insertAfter(l1..ln,E,K) = 
%			[], n = 0
%			l1 U K U insertAfter(l2..ln,E,K), l1 == E
%			l1 U insertAfter(l2..ln,E,K), otherwise
%	(List, int, int,List)
%	(i,i,i,o)
insertAfter([],_,_,[]).
insertAfter([H|T],E,K,[H|R]) :- H =:= E, insertAfter(T,E,K,R1), R = [K|R1].
insertAfter([H|T],E,K,[H|R]) :- H =\= E, insertAfter(T,E,K,R).

% main(l1..ln) = insertAfter(l1..ln,E,2*E-1), E = getCmmmcList(l1..ln) 
main(L,R) :- getCmmmcList(L,1,E), K is 2*E-1, insertAfter(L,E,K,R).
