;; Ex 4.3 : 3-Trees

(defstruct 3tree data left middle right)

(defun 3tree-clone (tr)
  (if (null tr) nil
      (make-3tree :data   (3tree-val tr)
                  :left   (3tree-clone (3tree-left tr))
                  :middle (3tree-clone (3tree-middle tr))
                  :right  (3tree-clone (3tree-right tr)))))

(defun 3tree-member (obj tr)
  (if (null tr) nil
      (or (eql obj   (3tree-data tr))
          (3tree-member obj (3tree-left tr))
          (3tree-member obj (3tree-middle tr))
          (3tree-member obj (3tree-right tr)))))
