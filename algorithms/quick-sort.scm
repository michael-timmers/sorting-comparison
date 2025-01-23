(define-module (algorithms quick-sort)
    #:use-module (srfi srfi-1) ;;partition
    #:use-module (srfi srfi-11) ;;let-values
    #:export (quick-sort)) 

(define (quick-sort lst)
    (cond ((null? lst)
    '())
        ((or (not (pair? lst)) (null? (cdr lst)))
        lst)
        (else (let* ((pivot (car lst)))
            (let-values (((greater lesser)
                (partition (lambda (x) (< pivot x)) (cdr lst))))
              (append (quick-sort greater) (list pivot) (quick-sort lesser)) )))))