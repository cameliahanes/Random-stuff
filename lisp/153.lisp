(defun reverse_(lis)
	(cond
		((atom lis) lis)
		((listp lis) (mapcar 'reverse_(reverse lis) ) )
	)
)



