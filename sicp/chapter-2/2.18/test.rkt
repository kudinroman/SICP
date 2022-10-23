#lang racket/base

(require rackunit "2.18.rkt")

(check-equal? (reverse-rec `(1 2 3 4 55)) `(55 4 3 2 1))
(check-equal? (reverse-iter `(1 2 3 4 55)) `(55 4 3 2 1))