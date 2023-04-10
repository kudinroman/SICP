#lang racket/base

(require rackunit "../common.rkt")

(define (func x)
  (if
    (pair? x)
    (count-leaves x)
    1))

(define (count-leaves tree)
  (accumulate-new + 0 (map func tree)))

(provide
  count-leaves
)
