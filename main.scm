#!guile \
-e main -s

run the script with ./main.scm
!#

(use-modules (timing utils))
(use-modules (algorithms bubble-sort))

(define unsorted-list '( 4 3 6 2 1 3))
(define NUM-TESTS 10)

(define (main args)
    ;;compose the sorting algorithm with the args so that it can be passed to the timing function.
    (define func (lambda () (bubble-sort unsorted-list)))
    (display (get-avg-exc-time func NUM-TESTS))
    (newline))