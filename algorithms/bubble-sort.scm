(define-module (algorithms bubble-sort)
#:use-module (srfi srfi-1)
    #:use-module (utils last)
    #:export (bubble-sort bubble-sort2 drop-last single-bubble drop-last))

;;Not the same as a for-loop style bubble sort
;;instead it calls single-bubble which moves the smallest numbre to the end
;;then the list is reversed and the single-bubble sort is called again on the other elements.
;;the list is returned in reverse order

(set-procedure-property! bubble-sort 'name "Bubble sort")
(define (bubble-sort lst compr)
    (cond ((null? lst)
        '())
        ((last? lst)
        lst)
        (else (let* ((lst-rev (reverse (single-bubble lst compr))))
            (cons (car lst-rev) (bubble-sort (single-bubble (cdr lst-rev) compr) compr))))))

(set-procedure-property! bubble-sort2 'name "Bubble sort 2")
(define (bubble-sort2 lst compr)
    (cond ((null? lst)
        '())
        ((last? lst)
        lst)
        (else (let* ((bubbled-lst (single-bubble lst <)))
            (append (bubble-sort2 (drop-last bubbled-lst) compr) (list (last bubbled-lst)))))))

(define (drop-last lst)
(if (last? lst)
'()
(cons (car lst) (drop-last (cdr lst)))))

(define (single-bubble lst compr)
    (cond ((last? lst)
            (cons (car lst) '()))
        ((not (compr (car lst) (cadr lst)))
            (cons (cadr lst) (single-bubble (cons (car lst) (cddr lst)) compr))) ;;swap the current and next elements
        (else (cons (car lst) (single-bubble (cdr lst) compr))))) ;;don't swap and continue
