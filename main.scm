#!guile \
-e main -s

run the script with ./main.scm
!#

(use-modules (srfi srfi-1))
(use-modules (utils timing))
(use-modules (algorithms bubble-sort))
(use-modules (algorithms quick-sort))
(use-modules (algorithms merge-sort))
(use-modules (algorithms selection-sort))

(define MAX-VAL 100)
(define LIST-LENGTH 1000)
(define unsorted-list (map (lambda (_) (random MAX-VAL)) (make-list LIST-LENGTH)))
(define NUM-TESTS 1000)

(set-procedure-property! sort 'name "Builtin sort")
(set-procedure-property! stable-sort 'name "Builtin stable sort")
(define sorting-algorithms (list bubble-sort quick-sort merge-sort selection-sort sort stable-sort))

(define (main args)
    (display "Sorting algorithm comparison\n")
    (display MAX-VAL) (display " max val, ") (display LIST-LENGTH) (display " list length and ") (display NUM-TESTS) (display " repeated averages of time.\n\n")
(display-ranked-algorithms sorting-algorithms))

(define (display-ranked-algorithms sorts)
    (display "  name  :  avg time (μs)  :  sorted?\n")
    (for-each (lambda (result)
        (display (car result)) (display " : ")
        (display (cadr result)) (display " : ")
        (display (caddr result)) (display "\n"))
    (get-ranked-results sorts))
    (newline))

(define (get-ranked-results sorts)
    (let* ((results (map
        (lambda (proc)
            (list (procedure-property proc 'name)
                (get-avg-exc-time (lambda () (proc unsorted-list <)) NUM-TESTS)
                (is-sorted? (proc unsorted-list <))))
        sorts))
        (ranked (sort results
            (lambda (a b) (< (cadr a) (cadr b))))))
    ranked))

(define (run-tests prod display-result?)
    (test-algorithm prod < display-result?)
    (profile-time prod <)
    (newline))

(define (test-algorithm proc compr display-result?)
    (define result (proc unsorted-list compr))
    (display "Testing ") (display (procedure-property proc 'name))
    (cond ((eq? display-result? #t)
        (display "\nUnsorted:") (display unsorted-list)
        (display "\nSorted:") (display result)
        (newline))
    (else
        (display "\nSorted:")
        (display (is-sorted? lst))
        (newline))))

(define (profile-time proc compr)
    ;;compose the sorting algorithm with the unsorted list so that it can be passed to the timing function.
    (define func (lambda () (proc unsorted-list compr)))
    (display "Timing ") (display (procedure-property proc 'name))
    (display "\nAverage time: ") (display (get-avg-exc-time func NUM-TESTS)) (display "μs")
    (newline))

;;checks both ways of sorting
    (define (is-sorted? lst)
    (or (sorted? lst <) (sorted? lst >)))