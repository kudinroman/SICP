#lang racket/base

(require rackunit "2.30.rkt")

(define source-list
    (list   1
            (list   2
                    (list 3 4)
                    5)
            (list 6 7)))

(define result-list
    (list   1
            (list   4
                    (list 9 16)
                    25)
            (list 36 49)))

(check-equal? (square-tree source-list) result-list)
(check-equal? (square-tree-map source-list) result-list)