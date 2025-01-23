#!guile \
-e main -s

run the script with ./main.scm
!#

(use-modules (srfi srfi-1))
(use-modules (timing utils))
(use-modules (algorithms bubble-sort))
(use-modules (algorithms quick-sort))

(define MAX-VAL 10)
(define LIST-LENGTH 10)
(define unsorted-list (map (lambda (_) (random MAX-VAL)) (make-list LIST-LENGTH)))
(define NUM-TESTS 1000)

(define (main args)
(display "Sorting algorithm comparison\n")
(test-algorithm bubble-sort)
(test-algorithm quick-sort)
    (newline))

(define (test-algorithm prod)
    (display "Testing ") (display (procedure-property prod 'name))
    (display "\nUnsorted:") (display unsorted-list)
    (display "\nSorted:") (display (prod unsorted-list))
    (newline))

(define (time-profile prod)
    ;;compose the sorting algorithm with the unsorted list so that it can be passed to the timing function.
    (define func (lambda () (prod unsorted-list)))
    (display "Timing ") (display (procedure-property prod 'name))
    (display "\nAverage time: ") (display (get-avg-exc-time func NUM-TESTS))
    (newline))