#lang racket/base

(require rackunit "1.3.rkt")

(check-equal? (f 2 3 4) 25)
(check-equal? (f 1 4 2) 20)
(check-equal? (f 2 3 1) 13)