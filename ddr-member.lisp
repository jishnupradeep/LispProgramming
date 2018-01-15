;; Member - To return true iff member of list
(in-package #:ddr-tests)


(defparameter *member-kb*
  '((member ?x (cons ?x ?lst))
    (<- (member ?x (cons ?y ?lst)) (member ?x ?lst))))
