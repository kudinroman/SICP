#lang racket/base

(require rackunit "1.42.rkt")
(require rackunit "../common.rkt")

(check-equal? ((compose square inc) 6) 49)
(check-equal? ((compose cube dec) 5) 64)