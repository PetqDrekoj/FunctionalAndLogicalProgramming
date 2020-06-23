% candidate(l1..ln) = { 
% 				(l1, l2..ln)
% 				(e,l1 U L), (e,L) = candidate(l2..ln)
% List, List, int
% (i,o,o)
candidate([H|T],H,T).
candidate([H|T],E,R) :- candidate(T,E,R1),R=[H|R1].

% abs(R) = { 
% 			R, R > 0
% 			-R, R < 0
% int, int
% (i,o)
abs(R,P) :- R<0,P is -1*R,!.
abs(R,R).

% okay(E, l1..ln) = 
% 			true, n = 0
% 			true, n = 1 && abs(l1-E) = 1
% 			true, n > 1 && abs(l1-E) = 1
% 			okay(E, l2..ln), n > 1 && abs(l1-E) != 1
% 			false, otherwise.
% (Int, List)
% (i,i)
okay(_,[]).
okay(E,[H]):- R is E-H, abs(R,T),T is 1,!.
okay(E,[H,_|_]):- R is E-H, abs(R,T),T is 1,!.
okay(E,[_,H1|T]):- okay(E,[H1|T]).

% clist(N) = {
% 			[], N = 0
% 			N U clist(N-1)
% int, List
% (i,o)
clist(0,[]) :- !.
clist(N,[N|R]):- N1 is N - 1,clist(N1,R).

% invertList(l1..ln) = {
% 				[], n = 0
% 				invertList(l2..ln) U l1, otherwise
% (List,List,List)
% (i,i,o)
invertList([],R,R).
invertList([H|T],P,R):- invertList(T,[H|P],R). 

% backtrack(l1..ln,r1..rn) = 
% 			invertList(r1..rn), n = 0
% 			backtrack(L, e U r1..rn), (e,L) = candidate(l1..ln) && okay(e,r1..rn)
% (i,i,o)
backtrack([],R,P) :- invertList(R,[],P).
backtrack(L,R,P):- candidate(L,E,R1),okay(E,R),backtrack(R1,[E|R],P).


% main(N) = backtrack(clist(N))
% (Int, List)
% (i,o)
main(N,R) :- clist(N,R1),backtrack(R1,[],R).



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
