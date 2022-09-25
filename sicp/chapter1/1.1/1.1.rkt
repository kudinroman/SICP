#lang racket/base

(define (f10) 10)
(define (f12) (+ 5 3 4))
(define (f8) (- 9 1))
(define (f3) (/ 6 2))
(define (f6) (+ (* 2 4) (- 4 6)))
(define a 3)
(define b (+ a 1))
(define (f19) (+ a b (* a b)))
(define (f-false) (= a b))

(define (f4)
    (if (and (> b a) (< b (* a b)))
        b
        a))

(define (f16)
    (cond ((= a 4) 6) 
        ((= b 4) (+ 6 7 a))
        (else 25)))

(define (ff6)
    (+ 2 (if (> b a) b a)))

(define (ff16)
    (* (cond ((> a b) a)
            ((< a b) b)
            (else -1))
        (+ a 1)))

(provide f10 f12 f8 f3 f6 f19 f-false f4 f16 ff6 ff16)

