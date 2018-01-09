(defun substitution(lis elem p)
	(cond
		((and (numberp lis) ( = lis elem )) p)
		((listp lis) (mapcar #'(lambda (lis) (substitution lis elem p)) lis))
		(T lis)
	)
)




