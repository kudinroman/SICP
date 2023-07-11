#lang racket/base

(require rackunit "2.40.rkt")

(define unique-pairs-result '((1 2) (1 3) (2 3)))
(define prime-sum-pairs-result
  '((1 2 3) (2 3 5) (1 4 5) (3 4 7) (2 5 7) (1 6 7) (5 6 11)))

(check-equal? (enumerate 6) '(1 2 3 4 5 6))
(check-equal? (unique-pairs 3) unique-pairs-result)
(check-equal? (prime-sum? '(1 2)) #t)
(check-equal? (prime-sum-pairs 6) prime-sum-pairs-result)
