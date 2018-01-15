;; Semantic Web Bundle
;; Corrections

;;To convert hyphenated-string to camelCase
(defun camelize (str &optional (capitalize nil))
  (if capitalize
    (remove #\- (string-capitalize str))
    (string-downcase (remove #\- (string-capitalize str)):start 0 :end 1)))


;;To hyphenate camelCase string.
(defun hyphenate (str &optional (case :upper))
  (let ((fun (if (eql case :upper) #'char-upcase #'char-downcase)))
    (with-output-to-string (out)
      (format out "~a" (funcall fun (schar str 0)))
      (reduce (lambda (last current)
                (if (and (lower-case-p last) (upper-case-p current))
                  (format out "-~a" (funcall fun current))
                  (format out "~a" (funcall fun current)))
                current)
      str))))