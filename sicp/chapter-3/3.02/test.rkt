#lang racket/base

(require rackunit "3.02.rkt")

(define s (make-monitored sqrt))

(check-equal? (s 100) 10)
(check-equal? (s "how-many-calls?") 1)
(check-equal? (s 81) 9)
(check-equal? (s "how-many-calls?") 2)
(s "reset-count")
(check-equal? (s "how-many-calls?") 0)

