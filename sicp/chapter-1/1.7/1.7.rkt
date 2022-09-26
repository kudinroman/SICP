#lang racket/base

(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (sqrt-iter guess x)
  (define new-guess (improve guess x))
  (if
    (good-enough? guess new-guess)
    new-guess
    (sqrt-iter new-guess x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess new-guess)
  (< (abs (- new-guess guess)) 0.001))

(provide my-sqrt)