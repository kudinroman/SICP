#lang racket/base

(require rackunit "2.35.rkt")

(define tree (list
                  1
                  2 
                  3
                  (list
                    4
                    5
                    (list 6 7 8))
                  9))

(check-equal? (count-leaves tree) 9)
