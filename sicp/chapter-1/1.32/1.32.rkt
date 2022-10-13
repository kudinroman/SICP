#lang racket/base

(define (accumulate-iter combiner start term a next b)
    (define (iter a result)
        (if
            (> a b)
            result
            (iter
                (next a)
                (combiner result (term a)))))
    (iter a start))

(define (accumulate-rec combiner term a next b)
    (if
        (= a b)
        (term a)
        (combiner
            (term a)
            (accumulate-rec
                combiner
                term
                (next a)
                next
                b))))

(provide accumulate-iter accumulate-rec)