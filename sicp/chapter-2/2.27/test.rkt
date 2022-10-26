#lang racket/base

(require rackunit "2.27.rkt")

(define x (list (list 1 2) (list 3 4)))
(define x-reversed (list (list 3 4) (list 1 2)))
(define x-deep-reversed (list (list 4 3) (list 2 1)))

(define y (list (list (list 1 2) (list 3 4)) (list (list 5 6) (list 7 8))))
(define y-reversed (list (list (list 5 6) (list 7 8)) (list (list 1 2) (list 3 4))))
(define y-deep-reversed (list (list (list 8 7) (list 6 5)) (list (list 4 3) (list 2 1))))


(check-equal? (reverse x) x-reversed)
(check-equal? (deep-reverse x) x-deep-reversed)

(check-equal? (reverse y) y-reversed)
(check-equal? (deep-reverse y) y-deep-reversed)


(check-equal? (deep-reverse-1 x) x-deep-reversed)
(check-equal? (deep-reverse-1 y) y-deep-reversed)