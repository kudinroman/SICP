#lang racket/base

(define (half x) (/ x 2))
(define (double x) (+ x x))
(define (inc x) (+ x 1))
(define (square x) (* x x))
(define (cube x) (* x x x))
(define (init x) x)

(provide
    half
    double
    inc
    square
    cube
    init)