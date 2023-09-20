#lang racket/base

(require rackunit "3.07.rkt")

(define peter-acc (make-account 100 'peter-pwd))
(check-equal? ((peter-acc 'peter-pwd 'withdraw) 10) 90)

(check-equal? (make-joint peter-acc 'wrong-password 'paul-pwd) "Wrong password")
(define paul-acc (make-joint peter-acc 'peter-pwd 'paul-pwd))

(check-equal? ((paul-acc 'paul-pwd 'withdraw) 10) 80)
