#lang racket/base

(require 
  racket/stream
  rackunit 
  "3.55.rkt"
  "../stream-common.rkt" 
  )

(define ones (stream-cons 1 ones))
(define integers (stream-cons 1 (add-streams ones integers)))

(define (partial-sums s)
  (stream-cons
    (stream-first s)
    (add-streams 
      (stream-rest s) 
      (partial-sums s))))

(check-equal? (stream-ref (partial-sums integers) 0) 1)
(check-equal? (stream-ref (partial-sums integers) 1) 3)
(check-equal? (stream-ref (partial-sums integers) 2) 6)
(check-equal? (stream-ref (partial-sums integers) 3) 10)
(check-equal? (stream-ref (partial-sums integers) 4) 15)
