#lang racket/base

(require rackunit "2.31.rkt")

(define source-list
    (list   1
            (list   2
                    (list 3 4)
                    5)
            (list 6 7)))

(define square-result-list
    (list   1
            (list   4
                    (list 9 16)
                    25)
            (list 36 49)))

(define inc-result-list
    (list   2
            (list   3
                    (list 4 5)
                    6)
            (list 7 8)))

(check-equal? (square-tree source-list) square-result-list)
(check-equal? (inc-tree source-list) inc-result-list)