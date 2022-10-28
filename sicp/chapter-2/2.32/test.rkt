#lang racket/base

(require rackunit "2.32.rkt")

(define tree (list 1 2 3))

(define result
        (list   (list)
                (list 3)
                (list 2)
                (list 2 3)
                (list 1)
                (list 1 3)
                (list 1 2)
                (list 1 2 3)))

(check-equal? (subsets tree) result)