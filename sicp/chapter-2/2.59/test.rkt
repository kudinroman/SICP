#lang racket/base

(require rackunit "2.59.rkt")

(define my-set (list 2 4 'asd))
(define adjoin-my-set (list 'asdf 2 4 'asd))
(check-equal? (element-of-set? 2 my-set) #t)
(check-equal? (element-of-set? 3 my-set) #f)
(check-equal? (element-of-set? 'asd my-set) #t)

(check-equal? (adjoin-set 'asd my-set) my-set)
(check-equal? (adjoin-set 'asdf my-set) adjoin-my-set)

(check-equal? (intersection-set '(a b c) '(a b d)) '(a b))

(check-equal? (union-set '(a b c) '(a b d)) '(c a b d))
(check-equal? (union-set '(a b c) '(d e f)) '(a b c d e f))

