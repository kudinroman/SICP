#lang racket/base

(require rackunit "interpreter.rkt")

(define global-env (setup-env))

(define input-prompt "Input:")
(define output-prompt "Value:")

(define (driver-loop)
  (prompt-for-input input-prompt)
  (let ((input (read)))
    (let ((output (eval~ input global-env)))
      (announce-output output-prompt)
      (user-print output)))
  (driver-loop))

(define (prompt-for-input string)
  (newline) (newline) (display string) (newline))
(define (announce-output string)
  (newline) (display string) (newline))

(driver-loop)
