(define-module (algorithms merge-sort)
    #:use-module (srfi srfi-1)
    #:use-module (srfi srfi-11) ;;for let-values
    #:use-module (utils last)
    #:export (merge-sort))

(set-procedure-property! merge-sort 'name "Merge sort")
(define (merge-sort lst compr)
    (if (last? lst)
        lst
(let-values (((l1 l2) (split-list lst)))
(merge-lists (merge-sort l1 compr) (merge-sort l2 compr) compr))))

(define (split-list lst)
(if (last? lst)
(values '() lst)
(let*  ((n (quotient (length lst) 2)))
(values (take lst n) (drop lst n))))) ;;return two lists 

(define (merge-lists l1 l2 compr)
    (cond ((null? l1)
            (if (last? l2)
                l2 ;;base case  where there is only one item left in l2
                (cons(car l2) (merge-lists l1 (drop l2 1) compr)))) ;;take from l2
        ((null? l2)
            (if (last? l1)
                l1 ;; base case where there is only one item in l1 left
                (cons (car l1) (merge-lists (drop l1 1) l2 compr)))) ;;take from l1
        ((compr (car l1) (car l2))
            (cons (car l1) (merge-lists (drop l1 1) l2 compr))) ;;take from l1
        (else
            (cons (car l2) (merge-lists l1 (drop l2 1) compr))) ;;take from l2
        ))