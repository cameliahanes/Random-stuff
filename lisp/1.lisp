; a.

(defun nth_elem(l k)
	( cond ( (null l) nil )
		( (= k 1) (car l) )
		( T (nth_elem (cdr l) (- k 1) ) ) 
	)
)

(print (nth_elem '(1 2 3 4) 3))
