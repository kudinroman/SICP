#lang racket/base

(require rackunit "../common.rkt")

(define (make-rect point1 point2) (cons point1 point2))
(define (start-rect rect) (car rect))
(define (end-rect rect) (cdr rect))

(define (rect-width rect)
    (-  (x-point (end-rect rect))
        (x-point (start-rect rect))))

(define (rect-hight rect)
    (-  (y-point (end-rect rect))
        (y-point (start-rect rect))))

(define (rect-square rect)
    (*  (rect-width rect)
        (rect-hight rect)))

(define (rect-perimeter rect)
    (+  (*  (rect-width rect) 2)
        (*  (rect-hight rect) 2)))

(provide
    make-rect
    rect-square
    rect-perimeter
    )