;; Matcher 1: 
(in-package #:exmatch)
;;After Corrections


;;NOT
(defun ?not (x y lsts)
  (cond ((null lsts) nil)
        ((null x) nil)
        ((match-p (car x) y lsts) nil)
        (t lsts)))

;;OR
(defun ?or (x y lsts)
  (cond ((null lsts) nil)
        ((null x) lsts)
        (t (?or (cdr x) y (match-p (car x) y lsts))))) 

;;AND
(defun ?and (x y lsts)
  (cond ((null lsts) nil)
        ((null x) lsts)
        (t (?and (cdr x) y (match-p (car x) y lsts))))) 

;;=
(defun ?= (pattern x lsts)
  (if (null x) nil
    (match-p (car pattern) (apply (cadr pattern) x (cddr pattern)) 
    lsts)))
                              


