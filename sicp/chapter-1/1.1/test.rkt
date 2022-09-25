#lang racket/base

(require rackunit "1.1.rkt")

(check-equal? (f10) 10)
(check-equal? (f12) 12)
(check-equal? (f8) 8)
(check-equal? (f3) 3)
(check-equal? (f6) 6)
(check-equal? (f19) 19)
(check-equal? (f-false) #f)
(check-equal? (f4) 4)
(check-equal? (f16) 16)
(check-equal? (ff6) 6)
(check-equal? (ff16) 16)
