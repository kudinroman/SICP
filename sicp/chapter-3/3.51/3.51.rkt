#lang racket/base

(require "../stream-common.rkt")

(define (stream-ref s n)
  (if (= n 0)
    (stream-car s)
    (stream-ref (stream-cdr s) (- n 1))))

(provide stream-ref)
