(defun replacing (tree node rnode) 
	(cond
		((and (atom tree) (string= tree node)) rnode)
		((atom tree) tree)
		((listp tree) (mapcar #'(lambda (tree)(replacing tree node rnode)) tree))
	)
)



