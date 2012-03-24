(defun helper (n lst)
  (reduce #'(lambda (n d)
	      (if (zerop (rem n d))
		  (/ n d)
		  n))
	  lst :initial-value n))

(defun pro5 (n)
  (labels ((rec (m lst)
	     (if (>= m n)
		 (apply #'* lst)
		 (rec (1+ m) (push (helper m lst) lst)))))
    (rec 2 '(1))))