#lang racket/base

(define (square x) (* x x))

(define (expt num pow)
  (expt-iter num pow 1))

(define (expt-iter num pow product)
  (cond ((= pow 0)
            product)
        ((even? pow)
            (expt-iter
                (square num)
                (/ pow 2)
                product))
        (else
            (expt-iter
                num
                (- pow 1)
                (* num product)))))

(provide expt)