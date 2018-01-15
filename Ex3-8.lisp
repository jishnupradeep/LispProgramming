;;Ex 3.8: List Printing
;; Function to print a list in dot notation
;; Working

(defun show-dots (x)
  (format t "~A" (print-dots x)))


(defun print-dots (x)   ;;Function to print each element with a dot in between
  (cond ((null x) nil)
        ((atom x) x)
        (t (format nil "(~A . ~A)" (print-dots (car x)) (print-dots (cdr x))))))



;;Correction
;;Print as you go

(defun show-dots (lst)
  (cond
    ((atom lst) (format t "~s" lst))
    (t  (format t "(")
        (show-dots (car lst))
        (format t " . ")
        (show-dots (cdr lst))
        (format t ")"))))



(defun show-list (x)
  (cond ((atom x) (format t "~s" x))
        (t (format t "[")
           (show-list (car x))
           (print-elements x)
           (format t "]"))))


(defun print-elements (x) 
  (do ((lst (cdr x) (cdr lst)))
      ((atom lst)
       (unless (null lst) (format t " . ~A" lst)))
      (format t " ")
      (show-list (car lst))))