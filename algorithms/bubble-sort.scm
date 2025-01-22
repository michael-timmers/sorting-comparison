(define-module (algorithms bubble-sort)
#:export (bubble-sort))

(define (bubble-sort lst)
    (if (null? lst)
        '()
        (let* ((lst-rev (reverse lst)))
            (cons (car lst-rev) (bubble-sort (single-buble (cdr rev-list)))))))

(define (single-bubble lst)
    (cond ((null? (cdr lst))
            (cons (car lst) '()))
        ((> (car lst) (cadr lst))
            (cons (cadr lst) (single-bubble (cons (car lst) (cddr lst))))) ;;swap the current and next elements
        (else (cons (car lst) (single-bubble (cdr lst)))))) ;;don't swap and continue
