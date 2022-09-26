#lang racket/base

(require rackunit "1.12.rkt")

(check-equal? (f 1 1) 1)
(check-equal? (f 1 5) 1)
(check-equal? (f 5 1) 1)
(check-equal? (f 2 2) 2)
(check-equal? (f 2 5) 5)
(check-equal? (f 5 2) 5)
(check-equal? (f 2 3) 3)
(check-equal? (f 3 4) 10)
(check-equal? (f 4 5) 35)
(check-equal? (f 5 7) 210)
(check-equal? (f 7 7) 924)