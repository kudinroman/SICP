#lang racket/base

(define (square x) (* x x))

(define (sum-squares x y)
    (+ (square x) (square y)))

(define (sum-squares-of-two-larger-numbers a b c)
    (cond
        ((and (< a b) (< a c))
            (sum-squares b c))
        ((and (< b c) (< b c))
            (sum-squares a c))
        (else
            (sum-squares a b))))

(provide (rename-out [sum-squares-of-two-larger-numbers f]))