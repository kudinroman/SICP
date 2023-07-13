#lang racket/base

(require rackunit "2.41.rkt")

(define unique-triples-result
  '((1 1 1) (1 1 2) (1 2 1) (1 2 2) (2 1 1) (2 1 2) (2 2 1) (2 2 2)))
(define triples-result
  '(((1 1 3) . 5)
    ((1 2 2) . 5)
    ((1 3 1) . 5)
    ((2 1 2) . 5)
    ((2 2 1) . 5)
    ((3 1 1) . 5))
)

(check-equal? (unique-triples 2) unique-triples-result)
(check-equal? (triples 3 5) triples-result)
