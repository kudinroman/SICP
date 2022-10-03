#lang racket/base

(require rackunit "1.11.rkt")

(check-equal? (f-rec 1) 1)
(check-equal? (f-rec 2) 2)
(check-equal? (f-rec 3) 3)
(check-equal? (f-rec 4) 6)
(check-equal? (f-rec 5) 11)
(check-equal? (f-rec 6) 20)
(check-equal? (f-rec 7) 37)
(check-equal? (f-rec 8) 68)

(check-equal? (f-it 1) 1)
(check-equal? (f-it 2) 2)
(check-equal? (f-it 3) 3)
(check-equal? (f-it 4) 6)
(check-equal? (f-it 5) 11)
(check-equal? (f-it 6) 20)
(check-equal? (f-it 7) 37)
(check-equal? (f-it 8) 68)