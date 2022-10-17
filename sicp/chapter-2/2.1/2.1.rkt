#lang racket/base

(define (mul-rat x y)
    (make-rat   (* (numer x) (denom x))
                (* (numer y) (denom y))))

(define (make-rat n d)
    (let ((g (gcd n d)))
    (cons   (/ (abs n) g)
            (/ (abs d) g))))

(define (numer x) (car x))
(define (denom x) (cdr x))

(provide mul-rat make-rat)