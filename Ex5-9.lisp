;; Ex 5.9: Breadth First Search

(defun shortest-path (start end net)
  (bfs end (list (list start)) net))

(defun bfs (end queue net)
  (if (empty-queue-p queue)
      nil
    (let ((path (car queue)))
      (let ((node (car path)))
        (let ((paths (new-paths path node net end)))
          (cond ((member end paths) (return-from bfs paths))
                (t (bfs end
                        (append (cdr queue) paths)
                        net))))))))


(defun new-paths (path node net end)
  (let ((neighbors (cdr (assoc node net))))
    (if (member end neighbors) (reverse (cons end path))
        (mapcan #'(lambda (n)
                    (cond ((eql n end) (return-from new-paths (reverse (cons n path))))
                          ((not (member n path)) (list (cons n path)))
                          (t nil)))
                neighbors))))




;; Corrections
;; (a)

(defun shortest-path (start end net)
  (catch 'abort (bfs end (list (list start)) net)))

(defun bfs (end queue net)
  (if (empty-queue-p queue)
      nil
    (let ((path (car queue)))
      (let ((node (car path)))
        (bfs end
             (append (cdr queue)
                     (new-paths path node net end))
             net)))))

(defun new-paths (path node net end)
  (mapcan #'(lambda (n)
              (cond ((eql n end) (throw 'abort (reverse (cons n path))))
                    ((not (member n path)) (list (cons n path)))
                    (t nil)))
          (cdr (assoc node net))))



;(b) 

(defun shortest-path (start end net)
  (bfs end (list (list start)) net))

(defun bfs (end queue net)
  (if (empty-queue-p queue)
      nil
    (let ((path (car queue)))
      (let ((node (car path)))
        (let ((paths (new-paths path node net end)))
          (cond ((member end paths) (return-from bfs paths))
                (t (bfs end
                        (append (cdr queue) paths)
                        net))))))))


(defun new-paths (path node net end)
  (let ((neighbors (cdr (assoc node net))))
    (if (member end neighbors) (reverse (cons end path))
        (mapcan #'(lambda (n)
                    (cond ((eql n end) (return-from new-paths (reverse (cons n path))))
                          ((not (member n path)) (list (cons n path)))
                          (t nil)))
                neighbors))))







