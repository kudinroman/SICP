#lang racket/base

(define (half x) (/ x 2))
(define (double x) (+ x x))
(define (inc x) (+ x 1))
(define (dec x) (- x 1))
(define (square x) (* x x))
(define (cube x) (* x x x))
(define (init x) x)
(define (sum x y) (+ x y))
(define (mult x y) (* x y))

(provide
    half
    double
    inc
    dec
    square
    cube
    init
    sum
    mult)