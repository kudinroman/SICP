#lang racket/base

(require rackunit "../common.rkt")

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

(provide iter*)