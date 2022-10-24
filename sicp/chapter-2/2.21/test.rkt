#lang racket/base

(require rackunit "2.21.rkt")

(check-equal? (square-list1 `(1 2 3 4 5)) `(1 4 9 16 25))
(check-equal? (square-list2 `(1 2 3 4 5)) `(1 4 9 16 25))