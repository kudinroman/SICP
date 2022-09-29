#lang racket/base

(define (f-rec n)
    (if (< n 3)
        n
        (+
            (f-rec (- n 1))
            (f-rec (- n 2))
            (f-rec (- n 3)))))

(define (f-it n)
    (f-iter 2 1 0 n))

(define (f-iter product product-1 product-2 counter)
    (if (< counter 3)
        product
        (f-iter (+ product product-1 product-2)
                product
                product-1
                (- counter 1))))

(provide f-rec f-it)

