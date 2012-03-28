(defun cycle-length (number divisor)
  (let ((hs (make-hash-table :test #'eql)))
    (labels ((rec (n d h)
	       (multiple-value-bind (val fnd)
		   (gethash n hs)
		 (if fnd (- h val)
		     (let ((m (rem n d)))
		       (if (zerop m)
			   0
			   (progn
			     (setf (gethash n hs) h)
			     (rec (* 10 m) d (1+ h)))))))))
      (rec (* 10 number) divisor 1))))

(defun pro26 (cnt)
  (let ((max 0) (win 0))
    (dotimes (i cnt)
      (let ((len (cycle-length 1 (1+ i))))
	(if (> len win)
	    (setf max (1+ i)
		  win len))))
    (values max win)))