#lang racket/base

(require rackunit "2.28.rkt")

(define x (list (list 1 2) (list 3 4)))
(define x-1 (list 1 2 3 4))
(define x-2 (list 1 2 3 4 1 2 3 4))


(check-equal? (fringe x) x-1)
(check-equal? (fringe (list x x)) x-2)