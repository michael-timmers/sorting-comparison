#!guile \
-e main -s

run the script with ./main.scm
!#

(use-modules (srfi srfi-1))
(use-modules (timing utils))
(use-modules (algorithms bubble-sort))

(define MAX-VAL 1000)
(define LIST-LENGTH 10)
(define unsorted-list (map (lambda (_) (random MAX-VAL)) (make-list LIST-LENGTH)))
(define NUM-TESTS 1000)

(define (main args)
    ;;compose the sorting algorithm with the args so that it can be passed to the timing function.
    (define func (lambda () (bubble-sort unsorted-list)))
    (display (get-avg-exc-time func NUM-TESTS))
    (newline)
    (display (func))
    (newline))