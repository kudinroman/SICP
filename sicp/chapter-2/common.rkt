#lang racket/base

(define (average x y)
    (/  (+  x
            y)
        2))

(define (make-point x y) (cons x y))
(define (x-point point) (car point))
(define (y-point point) (cdr point))

(define (accumulate-new op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate-new op initial (cdr sequence)))))

(provide
    average
    make-point
    x-point
    y-point
    accumulate-new
    )
