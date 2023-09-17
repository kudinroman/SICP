#lang racket/base

(require rackunit "3.04.rkt")

(define acc (make-account 100 'my-password))
((acc 'my-password 'withdraw) 1)
((acc 'my-password 'withdraw) 1)
(check-equal? ((acc 'my-password 'withdraw) 1) 97)

((acc 'wrong-password 'withdraw) 1)
((acc 'wrong-password 'withdraw) 1)
((acc 'wrong-password 'withdraw) 1)
((acc 'wrong-password 'withdraw) 1)
((acc 'wrong-password 'withdraw) 1)
((acc 'wrong-password 'withdraw) 1)
(check-equal? ((acc 'wrong-password 'withdraw) 1) "Call-the-cops")
