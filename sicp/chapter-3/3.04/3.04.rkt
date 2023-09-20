#lang racket/base

(define (disp key value)
  (begin (display key)
         (display value)
         (display "\n")))

(define (make-account balance password)
  (let ((counter 0))
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
        (begin
          (set! counter 0)
          (cond ((eq? m 'withdraw) withdraw)
                ((eq? m 'deposit) deposit)
                (else (error "Undefined invoke -- MAKE-ACCOUNT" m))))
        (begin
          (set! counter (+ counter 1))
          (disp "Counter: " counter)
          (if (>= counter 7)
            (lambda (x) "Call-the-cops")
            (lambda (x) "Wrong password")))))
  dispatch))

(provide make-account)

