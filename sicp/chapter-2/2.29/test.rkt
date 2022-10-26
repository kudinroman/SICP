#lang racket/base

(require rackunit "2.29.rkt")

(define branch1 (make-branch 3 4))
(define branch2 (make-branch 2 3))
(define mobile (make-mobile branch1 branch2))
(define mobile-balanced (make-mobile branch1 branch1))

(check-equal? (left-branch mobile) branch1)
(check-equal? (right-branch mobile) branch2)

(check-equal? (total-weight mobile) 7) ; 4 + 3 = 7
(check-equal? (total-weight-balanced mobile) 18) ; (3 * 4) + (2 * 3) = 18

(check-equal? (mobile-balanced? mobile) #f)
(check-equal? (mobile-balanced? mobile-balanced) #t)

