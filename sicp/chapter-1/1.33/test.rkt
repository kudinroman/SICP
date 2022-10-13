#lang racket/base

(require rackunit "1.33.rkt")
(require rackunit "../common.rkt")

(check-equal? (filtered-accumulate-rec sum odd? 0 init 3 inc 6) 8) ; 8
(check-equal? (filtered-accumulate-rec sum odd? 0 init 1 inc 5) 9) ; 9
(check-equal? (filtered-accumulate-rec mult odd? 1 init 3 inc 6) 15) ; 15
(check-equal? (filtered-accumulate-rec mult odd? 1 init 1 inc 5) 15) ; 15

(check-equal? (filtered-accumulate-iter sum even? 0 init 3 inc 6) 10) ; 10
(check-equal? (filtered-accumulate-iter sum even? 0 init 1 inc 5) 6) ; 6
(check-equal? (filtered-accumulate-iter mult even? 1 init 3 inc 6) 24) ; 24
(check-equal? (filtered-accumulate-iter mult even? 1 init 1 inc 5) 8) ; 8

