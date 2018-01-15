Ex 4.4 : Binary Tree Search

(defun bst-elements (bst)
  (let ((lst nil))
    (bst-traverse #'(lambda (x) (push x lst)) bst)
    lst))