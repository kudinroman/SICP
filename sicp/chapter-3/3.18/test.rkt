#lang racket/base

(require rackunit rnrs/mutable-pairs-6 "3.18.rkt")

(define a (mcons 'a 'a))
(define b (mcons 'b a))
(set-mcdr! a b)

(define c (mcons 'c (mcons 'd '())))

(check-equal? (is-loop? a) #t)
(check-equal? (is-loop? c) #f)
