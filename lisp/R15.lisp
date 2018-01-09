(defun determ(L)
	((numberp L) 0)
	((and (listp L) (mod (car L) 2 0) ) 1)
	( (listp L) (apply '+ (mapcar #'(lambda (L) (determ L) )) ) )
)




