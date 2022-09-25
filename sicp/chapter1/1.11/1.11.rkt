#lang racket/base

(define (f-req n)
    (if (< n 3)
        n
        (+
            (f-req (- n 1))
            (f-req (- n 2))
            (f-req (- n 3)))))
            

(define (f-it n)
    (if (< n 3)
        n
        (f-iter 3 2 1 0 n)))

(define (f-iter counter product product-1 product-2 max-count)
    (if (> counter max-count)
        product
        (f-iter (+ counter 1)
                (+ product product-1 product-2)
                product
                product-1
                max-count)))

(provide f-req f-it)

