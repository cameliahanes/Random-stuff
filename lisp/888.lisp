(defun counter( tree level )
	(cond
		((= level 1) 1)
		((listp tree ) (apply '+ (mapcar #'(lambda (l) (counter tree (- level 1) )) (cdr tree)))	
		(t 0)
	)	

))



