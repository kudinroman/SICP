#lang racket/base

(require rackunit "1.30.rkt")
(require rackunit "../common.rkt")

(check-equal? (sum double 1 inc 5) 30) ; 2 + 4 + 6 + 8 + 10 = 30
(check-equal? (sum square 1 inc 5) 55) ; 1 + 4 + 9 + 16 + 25 = 55