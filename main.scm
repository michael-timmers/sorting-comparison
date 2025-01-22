#!guile \
-e main -s

run the script with ./main.scm
!#

(add-to-load-path "timing")
(add-to-load-path "algorithms" )

(use-modules (timing get-elapsed-time))
(use-modules (algorithms bubble-sort))

(define (main args)
    (define func (lambda () (bubble-sort args)))
    (display (func))
    (newline))