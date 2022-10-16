#lang racket/base

(define (double-x f)
    (lambda (x) (f (f x))))

(provide double-x)