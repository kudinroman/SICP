#lang racket/base

(define (f x y)
    (if
        (or
            (= x 1)
            (= y 1))
        1
        (+
            (f (- x 1) y)
            (f x (- y 1)))))

(provide f)