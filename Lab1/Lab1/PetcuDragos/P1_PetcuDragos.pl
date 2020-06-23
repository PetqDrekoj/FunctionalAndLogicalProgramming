% insert(l1...ln,e,position,index) = { [e], n = 0
%									   l1 U insert(l2..ln), index < position
%									   e U [l1..ln], index = position }
% insert(L-list,E-int,Position-int,Index-int,Result-list)
% (i,i,i,i,o)
insert([],E,_,_,[E]).
insert([H|L],E,Position,Index,Result) :- Index < Position, Index1 = Index + 1, insert(L,E,Position,Index1,Result1), Result = [H|Result1].
insert(L,E,Position,Index,Result) :- Index =:= Position, Result = [E|L].

% mainInsert(L-list, E-int, Position-int, Result-list
% (i,i,i,0)
mainInsert(L,E,Position,Result) :- insert(L,E,Position,1,Result).





% cmmdc(L1-int,L2-int,R-int)
cmmdc(L1,0,L1).
cmmdc(L1,L2,R) :- Aux is mod(L1,L2), cmmdc(L2,Aux,R).

% cmmdcList(l1..ln) = {  1, n = 0
% 					     cmmdc(l1,cmmdcList(l2..ln)), otherwise }
% cmmdcList(L-list,R-int)
% (i,o)
cmmdcList([],0).
cmmdcList([H|L],R) :- cmmdcList(L,R1),cmmdc(H,R1,R).