%count(N: int, L: list)
%flow model(o,i,i)
length_list([],0).
length_list([_,T],L):-
    length_list(T,N),
    L is N+1.
