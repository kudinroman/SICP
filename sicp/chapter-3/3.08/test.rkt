#lang racket/base

(require rackunit "3.08.rkt")

(check-equal? (+ (f 0) (f 1)) 0)
(check-equal? (+ (f 1) (f 0)) 1)

