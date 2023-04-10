#lang racket/base

(require rackunit "2.33.rkt")

(define map-result (list 1 4 9 16 25))

(check-equal? (map-new
                (lambda (x) (* x x))
                (list 1 2 3 4 5))
                map-result)

(define append-result (list 1 2 3 4 5 6))

(check-equal? (append-new (list 1 2 3) (list 4 5 6))
              append-result)

(check-equal? (length-new (list 1 2 3 4 5 6)) 6)
