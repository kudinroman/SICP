#lang racket/base

(require rackunit "2.39.rkt")

(define init-seq '(1 2 3))
(define result-fold-right '(1 (2 (3 ()))))
(define result-fold-left '(((() 1) 2) 3))
(define result-seq '(3 2 1))

(check-equal?
  (fold-left list null init-seq)
  result-fold-left)

(check-equal?
  (fold-right list null init-seq)
  result-fold-right)

(check-equal?
  (reverse-fold-left init-seq)
  result-seq)

(check-equal?
  (reverse-fold-right init-seq)
  result-seq)
