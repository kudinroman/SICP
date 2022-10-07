#lang racket/base

(require rackunit "1.16.rkt")

(check-equal? (expt 2 2) 4)
(check-equal? (expt 2 3) 8)
(check-equal? (expt 2 4) 16)
(check-equal? (expt 2 5) 32)
(check-equal? (expt 2 6) 64)
(check-equal? (expt 2 7) 128)
(check-equal? (expt 2 8) 256)
(check-equal? (expt 2 9) 512)
(check-equal? (expt 2 10) 1024)
(check-equal? (expt 2 11) 2048)

(check-equal? (expt 3 2) 9)
(check-equal? (expt 3 3) 27)
(check-equal? (expt 3 4) 81)

(check-equal? (expt 4 2) 16)
(check-equal? (expt 4 3) 64)