;; Ex 3.9 : Longest Path

(defun longest-path (start end net)
  (or (reverse (depth-first-search end (list start) net))
      (if (eql start end) (list start) nil)))

(defun depth-first-search (end current net)
  (do ((best nil (if (> (length best) (length (get-path end (car neighbors) current best net))) best (get-path end (car neighbors) current best net)))
       (neighbors (cdr (assoc (car current) net)) (cdr neighbors)))
      ((null neighbors) best)))

(defun get-path (end neighbors current best net)
  (let ((path (if neighbors (cons neighbors current) nil)))
    (cond
      ((null path) nil)
      ((eql (car path) end) path)
      ((member (car path) (cdr path)) best)
      (t (depth-first-search end path net)))))





(defun longest-path (start end net)
  (or (reverse (dfs end (list start) net))
      (and (eql start end) (list start))))
  
(defun dfs (end path net &optional bestp)
Search for longest path should not need a best path parameter. If each level returns the longest path returned by the (possibly recursive) calls, then the end result has to be longest. No need to know what the outer (calling) function has found so far.
  (if (and (eql end (car path))
           (consp (cdr path)))
      path
    (let ((neighbors (cdr (assoc (car path) net))))
      (do ((temp neighbors (cdr temp))
           (bestp bestp
                  (if (or (null (member (car temp) path))
                          (eql (car temp) end))
                      (longerp (dfs end (cons (car temp) path) net bestp) bestp)
                    bestp)))
Avoid long functions. Refactor subtasks into well-named subfunctions. A common signal it's time to refactor is when you embed one big control structure inside another. In this case, the IF can be moved inside the LONGERP call, and then the whole conditional made into a subfunction so that the DO just has an update of the form

  (bestp ... (longero ... bestp))

          ((null temp) bestp)))))

(defun longerp (p1 p2) 
This is a misleading name. This is not a predicate but a function that always returns a path.
  (if (> (length p1) (length p2))
      p1
    p2))