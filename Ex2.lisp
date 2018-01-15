;;Corrections

;;2.8a

;Recursion
(defun print-dots (n)
  (cond ((= n 0) nil)
        (t (format t ".")
           (print-dots (1- n)))))


;;2.8b

;Looping
(defun get-a-count (lst)
                  (do ((newlst lst (cdr newlst))
                       (counter 0 (+ (if (eql 'a (car newlst)) (1+ counter) counter))))
                      ((null newlst) counter)))

;;Recursion
(defun get-a-count (lst)
  (cond ((null lst) 0)
        ((eql (car lst) 'a) (1+ (get-a-count (cdr lst))))
        (t (get-a-count (cdr lst)))))



2.9

;;(a)
(defun summit (lst)
  (apply #'+ (remove nil lst)))

;;(b)
;; Corrections
;; Checked for empty list first. Avoided making new variable bindings. 
(defun summit (lst)
    (cond ((null lst) 0)
        ((null (car lst)) (summit (cdr lst)))
        (t (+ (car lst) (summit (cdr lst))))))
