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

(define (enumerate-interval low high)
  (if (> low high)
    null 
    (cons low (enumerate-interval (+ 1 low) high))))

(define (flatmap proc seq)
  (foldr append (list) (map proc seq)))

(provide
    average
    make-point
    x-point
    y-point
    accumulate-new
    enumerate-interval
    flatmap
    )
