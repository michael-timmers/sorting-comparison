(define-module (timing get-elapsed-time)
#:use-module (srfi srfi-19) ;;import the time and date library
    #:export (get-elapsed-time))

(define (get-elapsed-time func)
    (let* ((start (current-time time-monotonic))
        (result (func))
        (end (current-time time-monotonic))
        (elapsed-time (- end start)))
    (display (string-append "Elapsed time: " (number->string elapsed-time) " µs\n"))
    result))