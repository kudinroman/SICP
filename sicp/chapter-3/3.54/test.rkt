#lang racket/base

(require 
  racket/stream
  rackunit 
  "3.54.rkt"
  "../stream-common.rkt" 
  )

(define ones (stream-cons 1 ones))
(define integers (stream-cons 1 (add-streams ones integers)))
(define factorial (stream-cons 1 (mul-streams factorial integers)))

(displayln (stream-ref integers 15))
(displayln (stream-ref factorial 15))

(check-equal? (stream-ref integers 2) 3)
(check-equal? (stream-ref factorial 5) 120)

