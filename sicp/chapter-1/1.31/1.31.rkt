#lang racket/base

(define (mult-iter term a next b)
    (define (iter a result)
        (if
            (> a b)
            result
            (iter
                (next a)
                (* result (term a)))))
    (iter a 1))

(define (mult-rec term a next b)
    (if
        (= a b)
        (term a)
        (* (term a) (mult-rec term (next a) next b))))

(provide mult-iter mult-rec)