;; Ex 9-6: Horner
;; Converting expression by Horner method

(defun horner (x &rest prmtrs)
  (reduce #'(lambda (a b)
              (+ (* a x) b))
          prmtrs))

