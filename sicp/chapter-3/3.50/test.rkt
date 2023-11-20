#lang racket/base

(require 
  rackunit 
  "../stream-common.rkt" 
  "3.50.rkt"
  )

(define stream1 (stream-enumerate-interval 1 5))
(define stream2 (stream-enumerate-interval 6 10))

(define result-stream (stream-map + stream1 stream2))

(check-equal? (stream-car result-stream) 7)
(check-equal? (stream-car (stream-cdr result-stream)) 9)
