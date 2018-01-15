;; Ex 7.2 : Map Stream

(defun map-stream (fn stream)
  (do ((expression (read stream nil "'")
                   (read stream nil "'")))
    ((equal expression "'"))
    (print expression)
    (funcall fn expression)))

(defun map-file (fn path)
  (with-open-file (stream path :direction :input)
    (map-stream fn stream)))



;;Correction

(defun map-stream (fn stream)
  (let ((sym-eof (gensym)))
    (do ((expression (read stream nil sym-eof)
      (read stream nil sym-eof)))
    ((eql expression sym-eof))
    (funcall fn expression))))

(defun map-file (fn path)
  (with-open-file (str path :direction :input)
    (map-stream fn str)))