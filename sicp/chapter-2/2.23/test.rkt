#lang racket/base

(require rackunit "2.23.rkt")

(check-equal? (for-each my-display `(1 2 3 4 5)) #t)