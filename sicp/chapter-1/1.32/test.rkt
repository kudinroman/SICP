#lang racket/base

(require rackunit "1.32.rkt")
(require rackunit "../common.rkt")

; 3 + 4 + 5 + 6 = 18
; 1 + 2 + 3 + 4 + 5 = 15
; 3 * 4 * 5 * 6 = 360
; 1 * 2 * 3 * 4 * 5 = 120

(check-equal? (accumulate-rec sum init 3 inc 6) 18) ; 18
(check-equal? (accumulate-rec sum init 1 inc 5) 15) ; 15
(check-equal? (accumulate-rec mult init 3 inc 6) 360) ; 360
(check-equal? (accumulate-rec mult init 1 inc 5) 120) ; 120

(check-equal? (accumulate-iter sum 0 init 3 inc 6) 18) ; 18
(check-equal? (accumulate-iter sum 0 init 1 inc 5) 15) ; 15
(check-equal? (accumulate-iter mult 1 init 3 inc 6) 360) ; 360
(check-equal? (accumulate-iter mult 1 init 1 inc 5) 120) ; 120

(define (factorial-iter x)
    (accumulate-iter mult 1 init 1 inc x))

(define (factorial-rec x)
    (accumulate-rec mult init 1 inc x))

(check-equal? (factorial-iter 6) 720) ; 720
(check-equal? (factorial-iter 6) 720) ; 720