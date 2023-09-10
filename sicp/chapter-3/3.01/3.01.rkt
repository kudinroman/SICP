#lang racket/base

(define (make-accumulator x)
  (lambda (z)
    (begin (set! x (+ z x))
           x)))

(provide make-accumulator)

