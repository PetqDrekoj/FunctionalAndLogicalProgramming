%8.a) Write a predicate to determine if a list has even numbers of elements without counting the elements from the list.
%  b) Write a predicate to delete first occurance of the minimum number from a list
% list_even(l1..ln,R)= {False - n=0, R=0
%                       True - n=0, R=1
%                       list_even(l2..ln,1), R=0
%                       list_even(l2..ln,0), R=1}
% list_even(L-list, R-int)
% (i,i)
list_even([],1).
list_even([_|T],0):- list_even(T,1).
list_even([_|T],1):- list_even(T,0).
    
%listEven(L-list)
%(i)
list_Even(L):-list_even(L,1).




%min_list(l1..ln,R)={R - n=0,
%                    min_list(l2..ln,l1)- l1<R,
%                    min_list(l2..ln,R) - l1>R}
% min_list(L-list, H1-int,M-int)
% (i,i,o)
min_list([],H1,H1).
min_list([H|T],H1,M):-H<H1,min_list(T,H,M).
min_list([H|T],H1,M):-H>=H1,min_list(T,H1,M).

%delete_first(l1..ln)={[]-n=0,
%                       [l2..ln]- l1=min_list(l1..ln,l1)
%                       l1Udelete_first(l2..ln) - l1!=min_list(l1..ln,l1)
%delete_first(L-list,R-list)
%(i,o)                      
delete_first([],[]).
delete_first([H|T],R):-min_list([H|T],H,M),H=:=M,R=T.
delete_first([H|T],R):-min_list([H|T],H,M),H\=M,delete_first(T,R1),R=[H|R1].

%2. a) a. Sort a list with keeping double valuesin resulted list.
%    b) For a heterogeneous list, formed from integer numbers and list of numbers,
% write a predicate to sort every sublist, keeping the doubles.
%sort_list(l1..ln)={[]-n=0,
%                   min_list(l1..ln,l1)U sort_list(delete_first(l1..ln))-otherwise}
%sort_list(L-list,R-list)
%(i,o)
sort_list([],[]).
sort_list([H|T],R):-min_list([H|T],H,M),delete_first([H|T],R1),sort_list(R1,R2),R=[M|R2].

%sort_list(l1..ln)={[]-n=0,
%                   sort_list(l1)U sort_Hlist(l2..ln)- l1 isList,
%                   l1 U sort_Hlist(l2..ln) otherwise}
%sort_Hlist(L-list,R-list)
%(i,o)
sort_Hlist([],[]).
sort_Hlist([[H1|H]|T],R):-sort_list([H1|H],R1),sort_Hlist(T,R2),R=[R1|R2].
sort_Hlist([H|T],R):-sort_Hlist(T,R1),R=[H|R1].


