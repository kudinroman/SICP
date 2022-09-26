#lang racket/base

(define (cube-root x)
    (cube-root-iter 1.0 x))

(define (cube-root-iter guess x)
  (define new-guess (improve guess x))
  (if
    (good-enough? guess new-guess)
    new-guess
    (cube-root-iter new-guess x)))

(define (improve y x)
  (/ 
    (+ 
        (/
            x
            (square y))
        (* 2 y))
    3))

(define (good-enough? guess new-guess)
  (< (abs (- new-guess guess)) 0.001))

(define (square x) (* x x))

(provide cube-root)