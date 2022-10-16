#lang racket/base

(require rackunit "../common.rkt")

(define (compose f1 f2)
    (lambda (x) (f1 (f2 x))))

(define (repeated func counter)
    (if
        (= counter 1)
        (lambda (x) (func x))
        (compose
            func
            (repeated func (dec counter)))))

(provide repeated)