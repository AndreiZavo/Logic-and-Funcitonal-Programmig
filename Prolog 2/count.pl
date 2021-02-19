count(0, [],_).
count(N,[X|T],X):- count(N1,T,X),N1 is N+1.
count(N,[H|T],X):-
    X/=H,
    count(N,T,X).

