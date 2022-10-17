#lang racket/base

(require rackunit "2.2.rkt")
(require rackunit "../common.rkt")

(define segm (make-segment  (make-point 2.0 7.0)
                            (make-point 11.0 15.6)))

(define mid-point (make-point 6.5 11.3))

(define (print-point p)
    (display "(")
    (display (x-point p))
    (display ",")
    (display (y-point p))
    (display ")"))

(define (print-segment segment)
    (print-point (start-segment segment))
    (display " - ")
    (print-point (end-segment segment)))

; (newline)
; (print-segment segm)
; (newline)
; (print-point (midpoint-segment segm))
(check-equal? (midpoint-segment segm) mid-point)