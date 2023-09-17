#lang racket/base

(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
      (begin (set! balance (- balance amount))
             balance)
      "Not enough money"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch p m)
    (if (eq? password p)
      (cond ((eq? m 'withdraw) withdraw)
            ((eq? m 'deposit) deposit)
            (else (error "Undefined invoke -- MAKE-ACCOUNT" m)))
    (lambda (x) "Wrong password")))
  dispatch)

(provide make-account)

