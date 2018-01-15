;; Matcher 2: ?CONTAINS
(in-package #:exmatch)

(defun ?contains (ptrn y &optional lst)
  (cond ((atom y) (match-p (car ptrn) y))
        (t (append (match-p (car ptrn) y)
                   (mapcan #'(lambda (x) (?contains ptrn x)) y)))))