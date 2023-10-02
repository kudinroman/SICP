#lang racket/base

(require rackunit "3.24.rkt")

(define t (make-table (lambda (x y) (< (abs (- x y)) 0.1))))
(define get (t 'lookup-proc))
(define put (t 'insert-proc!))

(put 1.0 1.0 'hello)
(check-equal? (get 1.01 1.01) 'hello)
(check-equal? (get 1.08 1.09) 'hello)
