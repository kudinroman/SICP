#lang racket/base

(require rackunit "../common.rkt")

(define (fold-right op init seq)
  (accumulate-new op init seq))

(define (fold-left op init seq)
  (define (iter result rest)
    (if (null? rest)
      result
      (iter (op result (car rest))
        (cdr rest))))
  (iter init seq))

(define (reverse-fold-right seq)
  (fold-right 
    (lambda (x y) (append y (list x)))
    null
    seq))

(define (reverse-fold-left seq)
  (fold-left 
    (lambda (x y) (cons y x))
    null
    seq))

(provide
  fold-left
  fold-right
  reverse-fold-left
  reverse-fold-right
  )
