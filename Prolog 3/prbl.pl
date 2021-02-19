% Write a predicate to generate the list of all subsets with all
% elements of a given list.
% Eg: [2, 3, 4] N=2 => [[2,3],[2,4],[3,4]]

%combination(l1,l2,..ln, x){
%                 [], x = 0
%                 l1 + combination(l2,..ln, x - 1), x > 0
%                 combination(l2,..ln,x), x > 0

% combiantion(L: list, X: number, Return_L: list)
% combination(i, i, o)

sum_of_subset([],_).
sum_of_subset([H|T],S):- S_new is S + H,
    sum_of_subset(T, S_new).


combination(_, 0, []).
combination([H|T], X, [H|R]):-
    X > 0,
    X_copy is X - 1,
    combination(T, X_copy, R).
combination([_|T], X, R):-
    X > 0,
    combination(T, X, R).

% solution(L: list, N: number, Return_L: list)
% solution(i,i,o)

solution(L, N, R):- findall(R_incomplete, combination(L,N,R_incomplete), R).









% insert(l1, l2, ..,ln, x){
%                [x], n = 0
%                x + l1,..,ln, n >= 1
%                l1 + insert(l2,...,ln, x) otherwise

% insert(L: list, X: number, Return_L: list)
% insert(i, i, o)

insert([], X, [X]).
insert([H|T], X, [X,H|T]).
insert([H|T], X, [H|R]) :-
    insert(T, X, R).


% permute(l1,l2,..ln){
%              [], n = 0
%              insert(permute(l2,..,ln,l1)), otherwise

% permute(L: list, Return_L: list)
% permute(i, o)

permute([], []).
permute([H|T], R) :-
    permute(T, RP),
    insert(RP, H, R).



















































