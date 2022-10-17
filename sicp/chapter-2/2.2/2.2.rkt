#lang racket/base

(require rackunit "../common.rkt")

(define (make-segment point1 point2) (cons point1 point2))
(define (start-segment segment) (car segment))
(define (end-segment segment) (cdr segment))

(define (midpoint-segment segment)
    (make-point     (average    (x-point (end-segment segment))
                                (x-point (start-segment segment)))
                    (average    (y-point (end-segment segment))
                                (y-point (start-segment segment)))))

(provide
    make-segment
    start-segment
    end-segment
    midpoint-segment
    )