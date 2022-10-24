#lang racket/base

(require rackunit "2.20.rkt")

(check-equal? (same-parity 1 2 3 4 5) `(1 3 5))
(check-equal? (same-parity 2 3 4 5 6) `(2 4 6))