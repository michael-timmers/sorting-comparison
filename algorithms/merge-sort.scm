(define-module (algorithms merge-sort)
#:use-module (srfi srfi-1)
#:use-module (srfi srfi-11)
#:export (merge-sort split-list merge-lists))

(set-procedure-property! merge-sort 'name "Merge sort")
(define (merge-sort lst)
    (if (null? (cdr lst))
        lst
(let-values (((l1 l2) (split-list lst)))
(merge (merge-sort l1) (merge-sort l2)))))

(define (split-list lst)
(if (null? (cdr lst))
(values '() lst)
(let*  ((n (quotient (length lst) 2)))
(values (take lst n) (drop lst n))))) ;;return two lists 

(define (merge-lists l1 l2)
    (cond ((null? l1)
            (if (null? (cdr l2))
                l2 ;;base case  where there is only one item left in l2
                (cons(car l2) (merge-lists l1 (drop l2 1))))) ;;take from l2
        ((null? l2)
            (if (null? (cdr l1))
                l1 ;; base case where there is only one item in l1 left
                (cons (car l1) (merge-lists (drop l1 1) l2)))) ;;take from l1
        ((< (car l1) (car l2))
            (cons (car l1) (merge-lists (drop l1 1) l2))) ;;take from l1
        (else
            (cons (car l2) (merge-lists l1 (drop l2 1)))) ;;take from l2
        ))