(defun compute_sum(l)
	(cond 
		((and (numberp l) (oddp l)) (* l -1) )
		((and (numberp l) (evenp l)) l)
		((listp l) (apply '+ (mapcar 'compute_sum l ) ))
		(T 0)
	)
)






