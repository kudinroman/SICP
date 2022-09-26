#lang racket/base

(require rackunit "1.7.rkt")

(check-equal? (sqrt 4) 2)
(check-equal? (sqrt 9) 3)
(check-equal? (sqrt 16) 4)
(check-equal? (sqrt 25) 5)
(check-equal? (sqrt 36) 6)