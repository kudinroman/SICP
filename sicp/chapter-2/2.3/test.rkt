#lang racket/base

(require rackunit "2.3.rkt")
(require rackunit "../common.rkt")

(define rect (make-rect (make-point 10 17)
                        (make-point 17 22)))

; (17 - 10) * (22 - 17)
; 7 * 5 = 35
(check-equal? (rect-square rect) 35)


; (17 - 10) * 2 + (22 - 17) * 2
; 7 * 2 + 5 * 2
; 14 + 10 = 24
(check-equal? (rect-perimeter rect) 24)