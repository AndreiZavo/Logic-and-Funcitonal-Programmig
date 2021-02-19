;a) Write a function to insert an element E on the n-th position of a linear list.

#||
insertOnPos(lst1,lst2,..lstn, e, pos){
			lst,if pos = 1
			lst1 U insertOnPos(lst2,..lstn, e, (pos - 1)), otherwise
		}
||#

(defun insertOnPos (lst e pos)
	(cond
		((equal pos 1) (cons e lst))
		(T (cons (car lst) (insertOnPos (cdr lst) e (- pos 1))))
	)
)

(print (insertOnPos '(6 7 8 9) 'Z 3))


;b) Write a function to return the sum of all numerical atoms of a list, at any level.

#||
sum-of-list(a1,a2,..an){
			0,if a = []
			0 + sum-of-list(a1) + sum-of-list(a2,..an),if a1 = list
			a1 + sum-of-list(a2,..an),if a1 = number
		}
||#

( defun sum-of-list (a)
	(cond
		((null a) 0)
		( (listp (car a))   (+ 0 (sum-of-list (car a)) (sum-of-list (cdr a)))) 
		(T (numberp (car a)) (+ (car a) (sum-of-list (cdr a)) ) )
	)
)

(print (sum-of-list '(1 2 (2 2) 3)))

#||
c) Write a function to return the set of all sublists of a given linear list. 
Ex. For list ((1 2 3) ((4 5) 6)) =>((1 2 3) (4 5) ((4 5) 6))
||#

#||
sublist(l1,l2,..ln){
		[],if l = []
		l1 U sublist(l1) U sublist(l2,..ln),if l1 = list
		sublist(l2,..ln), otherwise
	}
||#
(defun sublist (l) 
    (cond
        ((null l) nil)
        ((listp (car l)) (append (list (car l))  (sublist (car l)) (sublist (cdr l))))
        (T (sublist (cdr l)))
    )
)
(print (sublist '((1 2 3) 4 ((5 6) 7 8))))


;d) Write a function to test the equality of two sets, without using the difference of two sets.

#||
del_elem(lst1,lst2,..lstn x){
		[], if lst = []
		del_elem(lst2,..lstn, x),if lst1 = x
		lst1 U del_elem(lst2,..lstn, x), otherwise
	}
||#

(defun del_elem (lst x)
	(cond
		((null lst) nil)
		((eq (car lst) x) (del_elem (cdr lst) x))
		(T (cons (car lst) (del_elem (cdr lst) x)))
	)
)
#||
eq_of_sets(a1,a2,..,an,  b1,b2,bn){
		"Equal", if a = [] and b = []
		"Not equal", if a = [] or b = []
		eq_of_sets(cdr(a) del_elem(b car(a))), otherwise
	}
||#
(defun eq_of_sets (a b)
	(cond
		((and (null a) (null b)) (print "Equal"))
		((or (null a) (null b)) (print "Not equal"))
		(T (eq_of_sets (cdr a) (del_elem b (car a))))
	)
)

(eq_of_sets '(1 2 3) '(1 3 2))


(defun add_vec (a b)
	(cond
		((null a) nil)
		((null b) nil)
		(T (cons ( + (car a) (car b)) (add_vec (cdr a) (cdr b) )))
	)
)


(print (add_vec '(1 2 3) '(3 2 1)))
