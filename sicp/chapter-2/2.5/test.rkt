#lang racket/base

(require rackunit "2.5.rkt")

(check-equal? (car* (cons* 2 3)) 2)
(check-equal? (car* (cons* 4 1)) 4)
(check-equal? (car* (cons* 5 6)) 5)
(check-equal? (car* (cons* 8 2)) 8)


(check-equal? (cdr* (cons* 2 3)) 3)
(check-equal? (cdr* (cons* 4 1)) 1)
(check-equal? (cdr* (cons* 5 6)) 6)
(check-equal? (cdr* (cons* 8 2)) 2)