(defun sum (l)
	(cond
		((numberp l) l)
		((listp l) (apply '+ (mapcar 'sum l)))
		(T 0)
	)
)

(defun tests()
	(assert (= (sum 'a) 0))
	(assert (= (sum '(1 2 (3 4) (5 (6 7)))) 28))
	"All tests passed"
)


