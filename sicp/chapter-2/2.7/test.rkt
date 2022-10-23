#lang racket/base

(require rackunit "2.7.rkt")

(define interval (make-interval 3 7))
(check-equal? (car interval) 3)
(check-equal? (cdr interval) 7)