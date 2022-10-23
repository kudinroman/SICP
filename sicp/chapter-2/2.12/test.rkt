#lang racket/base

(require rackunit "2.12.rkt")

(check-equal? (percent (make-center-percent 80 10)) 10.0)
(check-equal? (center (make-center-percent 80 10)) 80.0)
(check-equal? (lower-bound (make-center-percent 80 10)) 72.0)
(check-equal? (upper-bound (make-center-percent 80 10)) 88.0)

(check-equal? (round (percent (make-center-percent 3.50 15))) 15.0)
(check-equal? (center (make-center-percent 3.50 15)) 3.5)
(check-equal? (lower-bound (make-center-percent 3.50 15)) 2.975) ; 3.5 * 0.85 = 2.975
(check-equal? (upper-bound (make-center-percent 3.50 15)) 4.025) ; 3.5 * 1.15 = 4.025
