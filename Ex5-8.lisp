;; Ex 5.8: Max-Min
;; Using recursion

;;Corrections
(defun max-min (vctr &key (start 0) (end (length vctr)) (maxv nil) (minv nil))
    (if (or (null vctr) (= start end))
        (values maxv minv)
        (let ((x (svref vctr start)))
            (max-min vctr :maxv (if (null maxv) x (max x maxv)) :minv (if (null minv) x (min x minv)) :start (1+ start) :end end))))


;; Using MAX and MIN with OR instead of IF

(defun max-min (vctr &key (start 0) (end (length vctr)) (maxv nil) (minv nil))
    (if (or (null vctr) (= start end))
        (values maxv minv)
        (let ((x (svref vctr start)))
            (max-min vctr :maxv (max x (or maxv x)) :minv (min x (or minv x)) :start (1+ start) :end end))))


