(format t "Hello World ~%")

(write (list 'A 'B 'C '1 '2 '3))

(setq cat (list 'A 'B 'C '1 '2))
(print cat)

(print (car cat))

(print (cdr cat))

(print (cons cat(cons 'G nil)))

(print (car(last cat)))

(setq dog (member '1 cat))
(print dog)

#||
(defvar name (read))
(defun hello-u(name)
	(format t "Hello ~a! ~%" name))
||#

(defvar n 0)
(print n)
(setf n 6)
(print n)

; operational operators
(format t "~%(+ 5 4) = ~d ~%" (+ 5 4))
(format t "(- 5 4) = ~d ~%" (- 5 4))
(format t "(* 5 4) = ~d ~%" (* 5 4))
(format t "(rem 5 4) = ~d ~%" (rem 5 4))
(format t "(mod 5 4) = ~d ~%" (mod 5 4))


; logical operators
(defvar age 5)
(if (not (= age 18))
	(format t "You can vote ~%")
	(format t "You can't vote ~%"))
	
(if (and (<= age 14) (>= age 67))
	(format t "Time for work ~%")
	(format t "Work if you want ~%"))

(if (or (<= age 14) (>= age 67))
	(format t "Time for work ~%")
	(format t "Work if you want ~%"))
		
	
(defun get-school (age)
	(case age
		(5 (print "Kindergarden"))
		(6 (print "First Grade"))
		(otherwise (print "Adult"))))

(get-school age)	
(terpri)
	

(defvar n 12)
(cond ( (>= n 10)
			(setf n 'yes)
			(format t "Ready for college ~%"))
	  ( (< n 10)
			(setf n 'no)
			(format t "Not ready ~%"))
	  (t (format t "Don't know ~%")))


(setq x 1)
(loop
	(format t "~d ~%" x)
	(setq x (+ x 1))
	(when (> x 10) (return x)))

(loop for x in '(A S D) do
	(format t "~s ~%" x))

#||
(loop for y from 100 to 110 do
	(print y))
||#

(cons 'superman 'batman)
(list 'superman 'btaman 'flash)
(cons 'aquaman '(superman batman))

(format t "First = ~a ~%" (car '(superman batman)))

(format t "Everything else = ~a ~%" (cdr '(superman batman flash)))

(format t "Second = ~a ~%" (cadr '(superman batman flash)))

(format t "Third = ~a ~%" (caddr '(superman batman flash)))

(format t "Is a list = ~a ~%" (listp '(batman superman)))

(format t "Is 4 in list = ~a ~%" (if (member 4 '(1 2 3)) 't nil))

(append '(just) '(some) '(rand))

(defparameter *num* '(2 4 6))
(push 1 *num*)
(print *num*)
(format t "2nd Item ~a ~%" (nth 2 *num*))



(defun foo (a b)
	(cond
		(T  (+ a b))
	)
)

(print (foo 4 5))

(defun foo2 (a b c)
	(+ a b c)
)
(print (foo2 1 2 3))

( defun avg( a b c)
	( / (+ a b c) 3)
)

(setq ans (avg 8 6 7))
(print ans)

( defun bigger (x y)
	(if (> x y) 
		(+ x 0)
		(+ y 0)
		)
)

(print (bigger 3 5))

(format t "~%")

( defun suma (a)
	(cond
		((null a) 0)
		( (listp (car a))   (+ 0 (suma (car a)) (suma (cdr a))) ) 
		(T (numberp (car a)) (+ (car a) (suma (cdr a)) ) )
	)
)

(print (suma '(1 2 (2 2) 3)))



	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	