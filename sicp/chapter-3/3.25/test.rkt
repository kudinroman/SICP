#lang racket/base

(require rackunit "3.25.rkt")

(define t1 (make-table))
(define v1 17)
(insert! t1 '(a b c) v1)
(check-equal? (lookup t1 '(a b c)) v1)
(check-equal? (lookup t1 '(a c)) #f)
(show t1)

(define t2 (make-table))
(define v2 222)
(insert! t2 '(1 2 3 4 5) v2)
(check-equal? (lookup t2 '(1 2 3 4 5)) v2)
(check-equal? (lookup t2 '(1 2 3 5)) #f)

(insert! t2 '(1 2 3 5 9) 333)
(show t2)
