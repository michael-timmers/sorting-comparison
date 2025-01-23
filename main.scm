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
    (display MAX-VAL) (display " max val, ") (display LIST-LENGTH) (display " list length and ") (display NUM-TESTS) (display " repeated averages of time.\n")
    (run-tests bubble-sort #f)
    (run-tests quick-sort #f)
    (run-tests merge-sort #f))

(define (run-tests prod display-result?)
    (test-algorithm prod display-result?)
    (profile-time prod )
    (newline))

(define (test-algorithm proc display-result?)
    (define result (proc unsorted-list))
    (display "Testing ") (display (procedure-property proc 'name))
    (cond ((eq? display-result? #t)
        (display "\nUnsorted:") (display unsorted-list)
        (display "\nSorted:") (display result)
        (newline))
    (else
        (display "\nSorted:")
        (display (or (sorted? result <) (sorted? (reverse result) <) ))
        (newline))))

(define (profile-time proc)
    ;;compose the sorting algorithm with the unsorted list so that it can be passed to the timing function.
    (define func (lambda () (proc unsorted-list)))
    (display "Timing ") (display (procedure-property proc 'name))
    (display "\nAverage time: ") (display (get-avg-exc-time func NUM-TESTS))
    (newline))