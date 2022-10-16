#lang racket/base

(require rackunit "1.41.rkt")
(require rackunit "../common.rkt")

(check-equal? (((double-x (double-x double-x)) inc) 5) 21)
(check-equal? ((double-x inc) 5) 7)
(check-equal? ((double-x dec) 5) 3)
(check-equal? ((double-x square) 5) 625)
(check-equal? ((double-x cube) 2) 512)