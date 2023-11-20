#lang racket/base

(require 
  rackunit 
  "../stream-common.rkt" 
  )

(define sum 0)
(define (accum x) (set! sum (+ x sum)) sum)
(define (f x) (= (remainder x 5) 0))

(define seq (my-stream-map accum (stream-enumerate-interval 1 20)))
(display-stream seq)

(define y (my-stream-filter even? seq))
(display-stream y)

(define z (my-stream-filter f seq))
(my-stream-ref y 7)
(display-stream z)
