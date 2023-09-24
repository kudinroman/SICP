#lang racket/base

(require compatibility/mlist rnrs/mutable-pairs-6)

(define (my-append x y)
  (if (null? x)
    y
    (mcons (mcar x ) (my-append (mcdr x) y))))

(define (my-append! x y)
  (set-mcdr! (last-pair x) y)
  x)

(define (last-pair x)
  (if (null? (mcdr x))
    x
    (last-pair (mcdr x))))

(provide my-append my-append!)

