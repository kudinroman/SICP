#lang racket/base
(require rackunit "../common.rkt")
(require math/number-theory)

(define (enumerate n)
  (enumerate-interval 1 n))

(define (unique-pairs i)
  (accumulate-new
    append
    null
    (map (lambda (i)
        (map (lambda (j) (list j i))
             (enumerate (- i 1))))
        (enumerate i))))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum?
               (unique-pairs n))))

(provide
  enumerate
  unique-pairs
  prime-sum?
  make-pair-sum
  prime-sum-pairs
  )

