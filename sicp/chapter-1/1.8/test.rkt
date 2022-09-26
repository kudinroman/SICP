#lang racket/base

(require rackunit "1.8.rkt")

(check-equal? (round (cube-root 8)) 2.0)
(check-equal? (round (cube-root 27)) 3.0)
(check-equal? (round (cube-root 64)) 4.0)
(check-equal? (round (cube-root 125)) 5.0)
(check-equal? (round (cube-root 127)) 5.0)