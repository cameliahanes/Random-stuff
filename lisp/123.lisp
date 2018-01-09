(defun substitution (lis elem r)
	(cond 
		((and (numberp lis) (if (= elem lis) r lis) ))
		((listp lis) (mapcar #' (lambda(A) (substitution A elem r)) lis ))
	)
)






