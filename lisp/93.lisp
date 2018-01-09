(defun removeocc( elem lis)
	(cond
		((atom lis) lis)
		((listp lis) (mapcar #'(lambda (lis) (removeocc elem lis)) (remove elem lis) ))	
	)
)


(defun removee(elem lis)
	(removeocc elem (remove elem lis) )
	
)
