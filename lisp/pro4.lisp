(defun palindromicp (number)
  (let ((str (format nil "~A" number)))
    (string= str (reverse str))))

(defun pro4 ()
  (let ((max 0))
    (dotimes (i 899)
      (dotimes (j 899)
	(let ((mul (* (+ 100 i) (+ 100 j))))
	  (if (and (palindromicp mul)
		   (> mul max))
	      (setf max mul)))))
    max))