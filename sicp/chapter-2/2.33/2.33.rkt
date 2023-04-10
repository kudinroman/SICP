#lang racket/base

(require rackunit "../common.rkt")

(define (map-new p sequence)
  (accumulate-new (lambda (x y) (cons (p x) y)) null sequence)) 

(define (append-new seq1 seq2)
  (accumulate-new cons seq2 seq1)) 

(define (length-new sequence)
  (accumulate-new (lambda (x y) (+ y 1)) 0 sequence))

(provide
  map-new
  append-new
  length-new
)
