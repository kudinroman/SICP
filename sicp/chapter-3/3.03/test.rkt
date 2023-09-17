#lang racket/base

(require rackunit "3.03.rkt")

(define acc (make-account 100 'my-password))

(check-equal? ((acc 'my-password 'withdraw) 50) 50)
(check-equal? ((acc 'my-password 'deposit) 10) 60)
(check-equal? ((acc 'wrong-password 'withdraw) 40) "Wrong password")
