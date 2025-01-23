#!guile \
-e main -s

run the script with ./main.scm
!#

(use-modules (srfi srfi-1))
(use-modules (utils timing))
(use-modules (algorithms bubble-sort))
(use-modules (algorithms quick-sort))
(use-modules (algorithms merge-sort))

(define MAX-VAL 100)
(define LIST-LENGTH 100)
(define unsorted-list (map (lambda (_) (random MAX-VAL)) (make-list LIST-LENGTH)))
(define NUM-TESTS 1000)

(define (main args)
    (display "Sorting algorithm comparison\n")
    (run-tests bubble-sort)
(run-tests quick-sort)
(run-tests merge-sort))

(define (run-tests prod)
    (test-algorithm prod)
    (profile-time prod)
    (newline))

(define (test-algorithm prod)
    (display "Testing ") (display (procedure-property prod 'name))
    (display "\nUnsorted:") (display unsorted-list)
    (display "\nSorted:") (display (prod unsorted-list))
    (newline))

(define (profile-time prod)
    ;;compose the sorting algorithm with the unsorted list so that it can be passed to the timing function.
    (define func (lambda () (prod unsorted-list)))
    (display "Timing ") (display (procedure-property prod 'name))
    (display "\nAverage time: ") (display (get-avg-exc-time func NUM-TESTS))
    (newline))