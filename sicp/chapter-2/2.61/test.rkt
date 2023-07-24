#lang racket/base

(require rackunit "2.61.rkt")

(define my-set (list 2 4 'asd))
#| (define adjoin-my-set (list 'asdf 2 4 'asd)) |#
(check-equal? (element-of-set? 3 '(1 2 3 5 8)) #t)
(check-equal? (element-of-set? 8 '(1 2 3 5 8)) #t)
(check-equal? (element-of-set? 4 '(1 2 3 5 8)) #f)

(check-equal? (intersection-set '(1 3 5 8 10) '(1 2 7 8 11)) '(1 8))

(check-equal? (adjoin-set 4 '(1 3 5)) '(1 3 4 5))
(check-equal? (adjoin-set 3 '(1 3 5)) '(1 3 5))
