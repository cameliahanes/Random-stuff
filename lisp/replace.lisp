(defun replevel(lis level elem)
	(cond 
		((and (= level 0) (atom lis)) (list elem))
		((atom lis) (list lis))

		( t 
			(list (mapcan #'(lambda (v) (replevel (- level 1) v)) lis) )
		)
	)
)



