;; Ex 9-2: Make-change
;;Corrctions 


;;Create default list if no list is given.
(defun make-change (amount &optional (lst '(25 10 5 1)))
    (values-list (make-coins amount lst)))

;;Using truncate to produce a quotient
(defun make-coins (amount lst)
    (cond ((null lst) nil)
        (t (multiple-value-bind (q r)
            (floor amount (car lst))
            (cons q (make-coins r (cdr lst)))))))