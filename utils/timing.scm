(define-module (utils timing)
    #:use-module (srfi srfi-1)
    #:use-module (srfi srfi-19) ;;import the time and date library
    #:export (get-elapsed-time get-avg-exc-time get-avg-exc-time-with-list))


(define (get-avg-exc-time func num-tests)
    (quotient (fold + 0
    ;;drop the first time, since this takes longer due to loading function into byte code or whatever it is doing...
        (cdr (map (lambda (_) (car (get-elapsed-time func))) (make-list num-tests))))
     num-tests))

(define (get-avg-exc-time-with-list proc test-lst)
    (quotient (fold + 0
    ;;drop the first time, since this takes longer due to loading function into byte code or whatever it is doing...
        (cdr (map (lambda (lst-item) (car (get-elapsed-time (lambda () (proc lst-item))))) test-lst)))
     num-tests))

;; returns pair, car is time elapsed, cdr is func output
(define (get-elapsed-time func)
    (let* ((start (current-time))
        (result (func))
        (end (current-time))
    (elapsed-time (time->microseconds (time-difference end start)))
        (display "elapsed time: " ) (display elapsed-time) (display " µs\n"))
    (cons elapsed-time result)))

(define (time->microseconds t)
  (+ (* (time-second t) 1000000) (quotient (time-nanosecond t) 1000)))  ;; Convert ns to µs
