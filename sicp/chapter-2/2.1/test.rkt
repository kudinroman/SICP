#lang racket/base

(require rackunit "2.1.rkt")

(define result (make-rat 1 3))

(check-equal?   (mul-rat    (make-rat 1 2)
                            (make-rat 2 3))
                result)

(check-equal?   (mul-rat    (make-rat -1 2)
                            (make-rat -2 -3))
                result)