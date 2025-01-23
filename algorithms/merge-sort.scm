(define-module (algorithms merge-sort)
#:use-module (srfi srfi-1)
#:export (merge-sort split-list))

(set-procedure-property! merge-sort 'name "Merge sort")
(define (merge-sort lst)
    (if (number? lst)
        lst
(let-values (((l1 l2) (split-list lst)))
))))

(define (split-list lst)
(if (= (length lst) 1)
lst
(let*  ((n (quotient (length lst) 2)))
(values (take lst n) (drop lst n))))) ;;return two lists 