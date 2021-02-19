;1. For a given tree of type (1) return the path from the root node to a certain given node X

;left_tree(l1...ln,no_nodes,no_edges)={	[],n=0
;                             			[],no_nodes=1+no_edges
;                             			l1 U l2 U left_tree(l3...ln, no_nodes+1, no_edges+l2),otherwise
;									}

(defun left_tree(tree no_nodes no_edges)
 (cond
  ((null tree) nil)
  ((equal no_nodes (+ 1 no_edges)) nil)
  (T (cons (car tree) (cons (cadr tree) (left_tree (cddr tree) (+ 1 no_nodes) (+ (cadr tree) no_edges)))))
 )
)

;right_tree(l1...ln,no_nodes,no_edges)={	[],n=0
;                             				tree,no_nodes=1+no_edges
;                        				    right_tree(l3...ln,no_nodes+1,no_edges+l2),otherwise
;										}

(defun right_tree(tree no_nodes no_edges)
 (cond
  ((null tree) nil)
  ((= no_nodes (+ 1 no_edges)) tree)
  (T (right_tree (cddr tree) (+ 1 no_nodes) (+ (cadr tree) no_edges)))
  )
)

;left(l1...ln) = left_tree(l3...ln, 0, 0)

(defun left(tree)
  (left_tree (cddr tree) 0 0)
)

;drept(l1...ln)=left_tree(l3...ln,0,0)

(defun right(tree)
 (right_tree (cddr tree) 0 0)
)

;(print (left '(A 2 B 0 C 2 D 0 E 0)))
;(print (right '(A 2 B 0 C 2 D 0 E 0)))

;check_element_in_list(e,l1...ln)={
;								false,n=0
;                               true,e=l1
;                               check_element_in_list(e,l2..ln),l1 is an atom
;                               check_element_in_list(e,l1) OR check_element_in_list(e,l2...ln),otherwise
;								}

(defun check_element_in_list (e l)
 (cond
  ((null l) nil)
  ((equal (car l) e) T)
  ((atom (car l)) (check_element_in_list e (cdr l)))
  (T (OR (check_element_in_list e (car l))(check_element_in_list e (cdr l))))
 )
)
 

;path_to(e,l1...ln)={
;					[],n=0
;                 	(e),e=l1
;                 	l1 U path_to(e, left(l1...ln)),e is in left(l1...ln)
;                 	l1 U path_to(e, right(l1...ln)),e is in right(l1...ln)
;                 	[],otherwise
;					}
(defun path_to(e tree)
 (cond
  ((null tree) nil)
  ((equal e (car tree)) (list e))
  ((check_element_in_list e (left tree)) (cons (car tree) (path_to e (left tree))))
  ((check_element_in_list e (right tree)) (cons (car tree) (path_to e (right tree))))
  (T nil)
 )
)

; A
;/ \
;B C
; / \
; D E
; 	/\
; 	X Y
;	/
;	Z

(print (path_to 'R '(A 2 B 2 H 0 R 0 C 2 D 0 E 2 X 1 Z 0 Y 0 )))
