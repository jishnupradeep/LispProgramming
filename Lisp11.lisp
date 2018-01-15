;; Lisp #11 : Map Range
;;

(defun map-range (fn start end)
  (loop with increment = (if (> end start) 1 -1)
        for i = start then (+ i increment) 
        until (= i end)
        collect (funcall fn i))) ;;accumulate values using collect and return them

(defun every-range (fn start end)
  (loop with increment = (if (> end start) 1 -1)
        for i = start then (+ i increment) 
        until (= i end)
        always (funcall fn i)))  ;;terminates when nil

(defun find-range (fn start end)
  (loop with increment = (if (> end start) 1 -1)
        for i = start then (+ i increment) 
        until (= i end)
        when (funcall fn i)
        do (return i)))

(defun reduce-range (fn start end &optional init)
  (do ((increment (if (> end start) 1 -1))
       (i start (+ increment i))
       (out init (funcall fn out i)))
      ((= i end) out)))
