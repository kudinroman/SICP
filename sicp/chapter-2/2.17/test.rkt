#lang racket/base

(require rackunit "2.17.rkt")

(check-equal? (last-pair `(1 2 3 4 55)) 55)