#lang racket/base

(require rackunit "1.43.rkt")
(require rackunit "../common.rkt")

(check-equal? ((repeated square 2) 5) 625)
(check-equal? ((repeated inc 12) 5) 17)