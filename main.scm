#!guile \
-e main -s

run the script with ./main.scm
!#

(add-to-load-path "algorithms" )

(use-modules (algorithms bubble-sort))

(define (main args)
(display (bubble-sort args))
(newline))