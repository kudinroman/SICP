#lang racket/base

(define (filtered-accumulate-iter combiner filter? start term a next b)
    (define (iter a result)
        (if
            (> a b)
            result
            (iter
                (next a)
                (if
                    (filter? a)
                    (combiner result (term a))
                    result))))
    (iter a start))

(define (filtered-accumulate-rec combiner filter? start term a next b)
    (if
        (= a b)
        (if
            (filter? a)
            (term a)
            start)
        (if
            (filter? a)
            (combiner
                (term a)
                (filtered-accumulate-rec
                    combiner
                    filter?
                    start
                    term
                    (next a)
                    next
                    b))
            (filtered-accumulate-rec
                combiner
                filter?
                start
                term
                (next a)
                next
                b)
            )))

(provide filtered-accumulate-iter filtered-accumulate-rec)