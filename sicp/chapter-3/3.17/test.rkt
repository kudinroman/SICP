#lang racket/base

(require rackunit compatibility/mlist rnrs/mutable-pairs-6 "3.17.rkt")

(define a (mcons 'a '()))
(define b (mcons a a))
(define c (mcons b b))

(define x (mcons 'x 'x))
(define y (mcons 'y x))
(set-mcdr! x y)

(check-equal? (count-pairs c) 3)
(check-equal? (count-pairs x) 2)
