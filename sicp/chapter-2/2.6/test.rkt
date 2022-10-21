#lang racket/base

; read the book "functional programming through lambda calculus"

(require rackunit "2.6.rkt")

(define (inc x) (+ x 1))

(check-equal? (((add-1 zero) inc) 0) 1)
(check-equal? (((add-1 one) inc) 0) 2)
(check-equal? (((add-1 two) inc) 0) 3)