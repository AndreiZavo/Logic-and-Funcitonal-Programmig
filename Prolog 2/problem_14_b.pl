count_app(VAL, [], 0).

count_app(VAL, [VAL|T], REZ):-
    count_app(VAL, T, NEW_RES),
    REZ is NEW_RES + 1.

count_app(VAL, [H|T], REZ) :- count_app(VAL, T, REZ).

check_set([H|T], A, OK):-
    count_app(H, A, NR),
    NR = 1,
    OK is 0.

check_set([H|T], A, OK):-
    check_set(T, A, OK).

check_set([], A, 1).
