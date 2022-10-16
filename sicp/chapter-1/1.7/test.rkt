#lang racket/base

(require rackunit "1.7.rkt")

(check-equal? (round (my-sqrt 4)) 2.0)
(check-equal? (round (my-sqrt 9)) 3.0)
(check-equal? (round (my-sqrt 16)) 4.0)
(check-equal? (round (my-sqrt 25)) 5.0)
(check-equal? (round (my-sqrt 36)) 6.0)
(check-equal? (round (my-sqrt 38)) 6.0)