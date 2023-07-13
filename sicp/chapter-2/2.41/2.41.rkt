#lang racket/base
(require rackunit "../common.rkt")
(require math/number-theory)

(define (unique-triples n)
  (flatmap (lambda (i)
    (flatmap (lambda (j)
      (map (lambda (k) (list i j k))
        (enumerate-interval 1 n)))
      (enumerate-interval 1 n)))
    (enumerate-interval 1 n)))

(define (numbers-sum l) (foldr + 0 l))

(define (triple-sum triple)
  (cons triple (numbers-sum triple)))

(define (triples n sum)
  (map triple-sum
    (filter (lambda (seq) (= sum (numbers-sum seq)))
      (unique-triples n))))

(provide
  unique-triples
  triples
  )
