#lang racket/base

(require rackunit "2.8.rkt")

(define i1 (make-interval 3 7))
(define i2 (make-interval 4 6))
(check-equal? (car i1) 3)
(check-equal? (cdr i1) 7)

(define add-i (add-interval i1 i2))
(check-equal? (lower-bound add-i) 7)
(check-equal? (upper-bound add-i) 13)

(define sub-i (sub-interval add-i i2))
(check-equal? (lower-bound sub-i) 1)
(check-equal? (upper-bound sub-i) 9)

(define mul-i (mul-interval i1 i2))
(check-equal? (lower-bound mul-i) 12)
(check-equal? (upper-bound mul-i) 42)

(define div-i-1 (make-interval 12 18))
(define div-i-2 (make-interval 2 4))
(define div-i (div-interval div-i-1 div-i-2))
(check-equal? (lower-bound div-i) 3.0)
(check-equal? (upper-bound div-i) 9.0)