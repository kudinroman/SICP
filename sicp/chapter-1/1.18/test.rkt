#lang racket/base

(require rackunit "1.18.rkt")

(check-equal? (iter* 2 4) 8)
(check-equal? (iter* 3 5) 15)
(check-equal? (iter* 1 1) 1)
(check-equal? (iter* 1 15) 15)
(check-equal? (iter* 4 8) 32)
(check-equal? (iter* 7 12) 84)