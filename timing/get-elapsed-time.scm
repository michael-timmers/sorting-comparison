(define-module (timing get-elapsed-time)
#:use-module (srfi srfi-19) ;;import the time and date library
    #:export (get-elapsed-time))

(define (time->microseconds t)
  (+ (* (time-second t) 1000000) (quotient (time-nanosecond t) 1000)))  ;; Convert ns to µs

;; returns pair, car is time elapsed, cdr is func output
(define (get-elapsed-time func)
    (let* ((start (current-time))
        (result (func))
        (end (current-time))
    (elapsed-time (time->microseconds (time-difference end start)))
        (display "elapsed time: " ) (display elapsed-time) (display " µs\n"))
    (cons elapsed-time result)))