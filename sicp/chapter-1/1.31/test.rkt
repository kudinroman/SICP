#lang racket/base

(require rackunit "1.31.rkt")
(require rackunit "../common.rkt")

; 3 * 4 * 5 * 6 = 360
; 1 * 2 * 3 * 4 * 5 = 120

(check-equal? (mult-rec init 3 inc 6) 360) ; 360
(check-equal? (mult-rec init 1 inc 5) 120) ; 120

(check-equal? (mult-iter init 3 inc 6) 360) ; 360
(check-equal? (mult-iter init 1 inc 5) 120) ; 120