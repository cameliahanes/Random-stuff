; function to return the sum of numeric atoms in a list at any level

(defun sum(l)
	(cond
		((numberp l) l)
		((listp l) (apply '+ (mapcar 'sum l) ) )
		(T 0)
	)
)



