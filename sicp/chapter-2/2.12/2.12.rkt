#lang racket/base

(define (make-interval a b) (cons a b))
(define (lower-bound interval) (min (car interval) (cdr interval)))
(define (upper-bound interval) (max (car interval) (cdr interval)))

(define (center i)
  (/  (+  (lower-bound i)
          (upper-bound i))
      2))

(define (make-center-percent c pct) 
  (let ((width (* c (/ pct 100.0))))
  (make-interval (- c width) (+ c width)))) 

(define (percent i) 
  (let  ((center (/ (+ (upper-bound i) (lower-bound i)) 2.0)) 
        (width (/ (- (upper-bound i) (lower-bound i)) 2.0))) 
  (* (/ width center) 100)))

(provide
  make-interval
  lower-bound
  upper-bound
  make-center-percent
  center
  percent
)