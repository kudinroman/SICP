#lang racket/base

(require rackunit compatibility/mlist rnrs/mutable-pairs-6 "3.12.rkt")

(define x (mlist 'a 'b))
(define y (mlist 'c 'd))
(define z (my-append x y))

(check-equal? z (mlist 'a 'b 'c 'd))
(check-equal? (mcdr x) (mlist 'b))

(define w (my-append! x y))

(check-equal? w (mlist 'a 'b 'c 'd))
(check-equal? (mcdr x) (mlist 'b 'c 'd))

