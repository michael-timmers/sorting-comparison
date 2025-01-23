(define-module (utils last)
#:export (last?))

(define (last? lst)
(null? (cdr lst)))