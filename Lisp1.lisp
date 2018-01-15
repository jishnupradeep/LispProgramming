;; Lisp #1 : has-number-p
;; 'some' returns true if function is true for atleast one element

(defun has-number-p (lst)
  (if (consp lst)
    (some #'has-number-p lst)
    (numberp lst)))