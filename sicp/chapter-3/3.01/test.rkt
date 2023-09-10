#lang racket/base

(require rackunit "3.01.rkt")

(define A (make-accumulator 5))
(check-equal? (A 10) 15)
(check-equal? (A 10) 25)
