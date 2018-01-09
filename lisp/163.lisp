(defun linearize(lis)
	(cond
		((atom lis) (list lis))
		((listp lis) (apply 'append(mapcar 'linearize lis ) ) )
	)
)



