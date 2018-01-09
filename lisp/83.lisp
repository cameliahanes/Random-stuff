(defun count_ (tree level)
	(cond 	
		((= level 1) 1)
		((listp tree) (apply '+ (mapcar #'(lambda (l) (count_ tree (- level 1))) (cdr tree))))
		(T 0)
	)

 )





