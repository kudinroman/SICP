#lang racket/base

(define (make-account balance . passwords)
  (define (withdraw amount)
    (if (>= balance amount)
      (begin (set! balance (- balance amount))
             balance)
      "Not enough money"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (add-account pwd)
      (begin (set! passwords (cons pwd passwords)) dispatch))
  (define (dispatch pwd m)
    (cond ((not (memq pwd passwords)) (lambda (x) "Wrong password"))
          ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          ((eq? m 'add-account) add-account)
          (else (error "Undefined invoke -- MAKE-ACCOUNT" m))))
  dispatch)

(define (make-joint account pwd new-pwd)
  ((account pwd 'add-account) new-pwd))

(provide make-account make-joint)

