(define-module (algorithms quick-sort)
    #:use-module (srfi srfi-1) ;;partition
    #:use-module (srfi srfi-11) ;;let-values
    #:use-module (utils last)
    #:export (quick-sort quick-sort2 quick-sort3)) 

;;iteration 1:
;Uses partition to seperate numbers that are lesser and greater than the pivot
;;recursively does this.

(set-procedure-property! quick-sort 'name "Quick sort")
(define (quick-sort lst compr)
    (cond ((null? lst)
    '())
        ((or (not (pair? lst)) (last? lst))
        lst)
        (else (let* ((pivot (car lst)))
            (let-values (((greater lesser)
                (partition (lambda (x) (compr pivot x)) (cdr lst))))
              (append (quick-sort greater compr) (list pivot) (quick-sort lesser compr)) )))))

;;iteration 2:
;;removed let*

(set-procedure-property! quick-sort2 'name "Quick sort2")
(define (quick-sort2 lst compr)
    (cond ((null? lst)
    '())
        ((or (not (pair? lst)) (last? lst))
        lst)
        (else (let ((pivot (car lst)))
            (let-values (((greater lesser)
                (partition (lambda (x) (compr pivot x)) (cdr lst))))
              (append (quick-sort2 greater compr) (list pivot) (quick-sort2 lesser compr)) )))))

;;iteration 3:
;;used call-with-values

(set-procedure-property! quick-sort3 'name "Quick sort3")
(define (quick-sort3 lst compr)
    (if (or (null? lst) (last? lst))
        lst
        (call-with-values
            (lambda () (partition (lambda (x) (compr (car lst) x)) (cdr lst)))
            (lambda (greater lesser)
                (append (quick-sort3 greater compr) (cons (car lst) (quick-sort3 lesser compr)))))))
