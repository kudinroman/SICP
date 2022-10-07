#lang racket/base

(require rackunit "1.17.rkt")

(check-equal? (rec* 2 4) 8)
(check-equal? (rec* 3 5) 15)
(check-equal? (rec* 1 1) 1)
(check-equal? (rec* 1 15) 15)
(check-equal? (rec* 4 8) 32)
(check-equal? (rec* 7 12) 84)