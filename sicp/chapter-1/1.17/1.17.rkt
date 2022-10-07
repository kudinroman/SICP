#lang racket/base

(define (half x) (/ x 2))
(define (double x) (+ x x))

(define (rec* a b)
    (if
        (= b 0)
        0
        (if
            (even? b)
            (rec* (double a) (half b))
            (+ a (rec* a (- b 1))))))

(define (iter* a b)
    (iter*_ a b 0))

(define (iter*_ a b prod)
    (if
        (= b 0)
        prod
        (if
            (even? b)
            (iter*_ (double a) (half b) prod)
            (iter*_ a (- b 1) (+ prod a)))))

(provide rec* iter*)