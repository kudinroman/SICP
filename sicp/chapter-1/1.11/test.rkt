#lang racket/base

(require rackunit "1.11.rkt")

(check-equal? (f-req 2) 2)
(check-equal? (f-req 3) 3)
(check-equal? (f-req 4) 6)
(check-equal? (f-req 5) 11)
(check-equal? (f-req 6) 20)
(check-equal? (f-req 7) 37)

(check-equal? (f-it 2) 2)
(check-equal? (f-it 3) 3)
(check-equal? (f-it 4) 6)
(check-equal? (f-it 5) 11)
(check-equal? (f-it 6) 20)
(check-equal? (f-it 7) 37)