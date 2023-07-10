#lang racket/base

(require rackunit "../common.rkt")

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
    (car seqs)
    (cons (accumulate-new op init (map car seqs))
          (accumulate-n op init (map cdr seqs)))))

(provide
  accumulate-n 
  )
