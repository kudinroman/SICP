#lang racket/base

(require rackunit "../common.rkt")

(define (rec* a b)
    (if
        (= b 0)
        0
        (if
            (even? b)
            (rec* (double a) (half b))
            (+ a (rec* a (- b 1))))))

(provide rec*)