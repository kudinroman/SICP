#lang racket/base

(require 
  racket/stream
  rackunit 
  "3.53.rkt"
  "../stream-common.rkt" 
  )

(check-equal? (stream-ref s 0) 1)
(check-equal? (stream-ref s 1) 2)
(check-equal? (stream-ref s 2) 4)
(check-equal? (stream-ref s 3) 8)
(check-equal? (stream-ref s 4) 16)
(check-equal? (stream-ref s 5) 32)

