%Mathematical model:
%      nth_element(l1,l2,..ln,Pos){
%                      l1, if Pos = 1
%                      nth_elemnt(l2,..ln,Pos-1), otherwise
%                      }
%nth_element(L:list,N:position, H:head of list)
%flow model: (i,i,o)
nth_element([H|_],1,H).
nth_element([H|_],_,H).
nth_element([_|T],POS,ANS):-
    POS1 is POS - 1,
    nth_element(T,POS1,ANS).
