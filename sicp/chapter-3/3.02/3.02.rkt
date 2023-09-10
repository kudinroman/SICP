#lang racket/base

(define (make-monitored func)
  (let ((counter 0))
  (lambda (message)
    (cond ((eq? message "how-many-calls?") counter)
          ((eq? message "reset-count") (set! counter 0))
          (else (begin (set! counter (+ 1 counter))
                       (func message)))))))

(provide make-monitored)

