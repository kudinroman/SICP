#lang racket/base

(require 
  rackunit 
  "../stream-common.rkt" 
  "3.51.rkt"
  )

(define x (my-stream-map (lambda (x) x) (stream-enumerate-interval 0 10)))
(check-equal? (stream-ref x 5) 5)
(check-equal? (stream-ref x 7) 7)
