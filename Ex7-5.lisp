;; Ex 7.5 + 7.6 : Stream Subset
;; Corrected

(in-package :cs325-user)

;;; From Paul Graham's ANSI Common Lisp
;;; Figure 7.2, Page 129
;;;
;;; Requires fixed version of buf.lisp

(defun file-subst (xold new file1 file2)
  (with-open-file (in file1 :direction :input)
     (with-open-file (out file2 :direction :output
                                :if-exists :supersede)
       (stream-subst old new in out))))

(defun stream-subst (old new in out &key (wildcard #\+))    ;;Default wildcard +
  (let* ((pos 0)
         (len (length old))
         (buf (new-buf len))
         (from-buf nil))
    (do ((c (read-char in nil :eof)
            (or (setf from-buf (buf-next buf))
                (read-char in nil :eof))))
        ((eql c :eof))
      (cond ((matcher-p (elt old pos) c wildcard)
             (incf pos)
             (cond ((= pos len)            ; 3
                    (princ new out)
                    (setf pos 0)
                    (buf-clear buf))
                   ((not from-buf)         ; 2
                    (buf-insert c buf))))
            ((zerop pos)                   ; 1
             (princ c out)
             (when from-buf
               (buf-pop buf)
               (buf-reset buf)))
            (t                             ; 4
             (unless from-buf
               (buf-insert c buf))
             (princ (buf-pop buf) out)
             (buf-reset buf)
             (setf pos 0))))
    (buf-flush buf out)))





(defun matcher-p (old new wildcard)
  (case old
    (:wild new)
    (:digit (digit-char-p new))
    (:alpha (alpha-char-p new))
    (:alphanumeric (or (digit-char-p new)
                       (alpha-char-p new)))
    (otherwise (char-wild new old wildcard))))

(defun char-wild (new old wildcard)
  (or (char= old new)
      (char= old wildcard)))


