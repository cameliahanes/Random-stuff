(defun product(l)
	(cond
		((numberp l) l)
		((listp l) (apply '* (mapcar 'product l)))
		(T 1)
	)
)


