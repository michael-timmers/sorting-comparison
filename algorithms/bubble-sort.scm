(define-module (algorithms bubble-sort)
#:export (bubble-sort))

(define (bubble-sort lst)
    (cond ((null? (cdr lst))
            (cons (car lst) '()))
        ((> (car lst) (cadr lst))
            (cons (cadr lst) (bubble-sort (cons (car lst) (cddr lst))))) ;;swap the current and next elements
        (else (cons (car lst) (bubble-sort (cdr lst)))))) ;;don't swap and continue
