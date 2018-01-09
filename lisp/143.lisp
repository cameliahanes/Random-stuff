(defun atoms (lis)
	(cond 
		((atom lis) 1)
		((listp lis) (apply '+ (mapcar 'atoms lis ) ) )
	)
)



