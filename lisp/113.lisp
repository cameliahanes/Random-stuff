(defun depth(lis level)
	(cond
		((atom lis) level)
		((listp lis) (apply 'max (mapcar #'(lambda (lis) (depth lis (+ level 1))) lis)))
	)
)



