%15.
%
% a. Define a predicate to determine the predecessor of a number
% represented as digits in a list.
%Eg.: [1 9 3 6 0 0] => [1 9 3 5 9 9]
%
%
% b. For a heterogeneous list, formed from integer numbers and list of
% numbers, define a predicate to determine
%the predecessor of the every sublist considered as numbers.
%Eg.: [1, [2, 3], 4, 5, [6, 7, 9], 10, 11, [1, 2, 0], 6] =>
%[1, [2, 2], 4, 5, [6, 7, 8], 10, 11, [1, 1, 9] 6]
%

%a)

%Mathematical model:
%      predecesor(l1,l2,..,ln,carry){
%           [], if n = 0
%           [9], if n = 1 and l1 = 0
%           [l1-1], if n = 1 and l1 != 0
%           9 U predecesor(l2,..,ln,1), carry = 1 and l1=0
%          (l1-carry) U predecesor(l2,..,ln,carry),otherwise
%        }

%predecesor(L:list,C:carry(int),R:list)
%flow model: (i,i,o)
predecesor([], _, []) :- !.
predecesor([0], 1, [9]) :- !.
predecesor([N], 0, [NR]) :- NR is N - 1, !.
predecesor([0|T], 1, [9|R]) :-
    predecesor(T, 1, R), !.
predecesor([H|T], 0, [HR|R]) :-
    predecesor(T, C, R),
    HR is H - C.


%b)
%Mathematical model:
%      hetero_list(l1,l2,..,ln, list){
%      [], n = 0
%      predecesor(l1,carry) + hetero_list(l2,..,ln), is_list(l1) = True
%      l1 + hetero_list(l2,..,ln), otherwise

%hetero_list(L: list, R: list)
%flow model: hetero_list(i,o)

hetero_list([],[]).
hetero_list([H|T],[HR|R]):-
    is_list(H),
    !,
    predecesor(H,_,HR),
    hetero_list(T,R).
hetero_list([H|T],[H|R]):-
    hetero_list(T,R).



ex([],Suma).
ex([H|T],Suma):-
    is_list(H),
    Suma is [H],
    ex(T,Suma).
ex([H|T],Suma):- ex(T,Suma).






successor([],_,[]) :- !.
succesor([9],1,[0]) :- !.
succesor([N],_,[NR]) :- NR is N + 1, !.
succesor([9|T],1,[0|R]) :-
    succesor(T,1,R).
succesor([H|T],0,[HR|R]) :-
    succesor(T,C,R),
    HR is H + C.

