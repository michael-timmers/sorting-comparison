(define-module (algorithms quick-sort)
    #:use-module (srfi srfi-1) ;;partition
    #:use-module (srfi srfi-11) ;;let-values
    #:use-module (utils last)
    #:export (quick-sort)) 

;Uses partition to seperate numbers that are lesser and greater than the pivot 
;;recursively does this.

(set-procedure-property! quick-sort 'name "Quick sort")
(define (quick-sort lst)
    (cond ((null? lst)
    '())
        ((or (not (pair? lst)) (last? lst))
        lst)
        (else (let* ((pivot (car lst)))
            (let-values (((greater lesser)
                (partition (lambda (x) (< pivot x)) (cdr lst))))
              (append (quick-sort greater) (list pivot) (quick-sort lesser)) )))))