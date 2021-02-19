%Mathematical model:
%length_of_list(l1,l2,..,ln){
%                0, if n = 0
%                1 + length_of_list(l2,..,ln), otherwise
%                }
%length_of_list(L:list,N:int)
%flow_model(i,o)
length_of_list([],0).
length_of_list([_|T],N):-
    length_of_list(T,N1),
    N is N1 + 1.

%Mathematical model:
%member_of(l1,l2,..ln,x){
%                   false, n = 0
%                   true, l1 = x
%                   member_of(l2,..,ln,x), otherwise
%                  }
%member_of(L:list, X:element)
%flow_model(i,i)
member_of([X|_],X).
member_of([_|T],X):-
    member_of(T,X).


%Mathematical model
%remove_element_from_list(l1,..,ln,x,){
%                     [], if n = 0
%                     l1 + remove_element_from_list(l2,..ln,x), l1!=e
%                     remove_element_from_list(l2,..ln,x), l1=e
%                   }
% remove_element_from_list(L:list,X:element,Result:list resulted)
% flow model: remove_element_from_list(i,i,o)

remove_element_from_list([], _, []).
remove_element_from_list([H|T], X, R) :- H =:= X,
    remove_element_from_list(T, X, R).
remove_element_from_list([H|T], X, [H|R]) :- H =\= X,
    remove_element_from_list(T, X, R).


%Mathematical mode:
%equality_of_sets(a1,a2,..,an,b1,b2,..,bm){
%                     true, if n = m = 0
%                     equlity_of_sets(remove_element_from_list(a2,..,an,b1),remove_element_from_list(b2,..,bn,a1)),
%                     if n = m, member_of(a1,a2,..,an,b1) = true,
%                     member_of(b1,b2,..bm,a1) }
%                     equality_of_sets(L1:list, L2:list)
%                     flow_model(i,i,o)
equality_of_sets([],[]).
equality_of_sets([A_head|A_tail],[B_head|B_tail]):-
    length_of_list(A_tail,A_length),
    length_of_list(B_tail,B_length),
    A_length =:= B_length,
    member_of([B_head|B_tail],A_head),
    member_of([A_head|A_tail],B_head),
    remove_element_from_list(B_tail,A_head,NewA),
    remove_element_from_list(A_tail,B_head,NewB),
    equality_of_sets(NewA,NewB).







