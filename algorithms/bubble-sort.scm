(define-module (algorithms bubble-sort)
#:export (bubble-sort single-bubble))

;;Not the same as a for-loop style bubble sort
;;instead it calls single-bubble which moves the largest numbre to the end
;;then the list is reversed and the single-bubble sort is called again on the other elements.
;;the list is returned in reverse order

(define (bubble-sort lst)
    (cond ((null? lst)
        '())
        ((null? (cdr lst))
        lst)
        (else (let* ((lst-rev (reverse (single-bubble lst))))
            (cons (car lst-rev) (bubble-sort (single-bubble (cdr lst-rev))))))))

(define (single-bubble lst)
    (cond ((null? (cdr lst))
            (cons (car lst) '()))
        ((> (car lst) (cadr lst))
            (cons (cadr lst) (single-bubble (cons (car lst) (cddr lst))))) ;;swap the current and next elements
        (else (cons (car lst) (single-bubble (cdr lst)))))) ;;don't swap and continue
