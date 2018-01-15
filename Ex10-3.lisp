;;Ex 10.3 + 10.5 Macros

;;Macro to return value of nth expression
(defmacro nth-expr (n &rest expr)
    `(case ,n
       ,@(loop for i in expr
               for n from 1
               collect `((,n) ,i))))


;;Macro to return list of n successive values returned by expression 
(defmacro n-of (n expr)
  (let ((num (gensym)) (i (gensym)) (lst (gensym)))  ;;local variable with gensym
    `(do ((,num ,n) (,i 0 (1+ ,i)) (,lst nil (cons ,expr ,lst)))
         ((= ,i ,num) (nreverse ,lst)))))
