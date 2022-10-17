#lang racket/base

(define (average x y)
    (/  (+  x
            y)
        2))

(define (make-point x y) (cons x y))
(define (x-point point) (car point))
(define (y-point point) (cdr point))

(provide
    average
    make-point
    x-point
    y-point
    )