#lang racket/base

(require rackunit "2.62.rkt")

(check-equal? (union-set '(1 3 5 8) '(2 4 6 7)) '(1 2 3 4 5 6 7 8))
(check-equal? (union-set '(4 5 6) '(1 2 3)) '(1 2 3 4 5 6))
(check-equal? (union-set '(1 2 3) '(2 3 4)) '(1 2 3 4))
