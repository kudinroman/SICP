#lang racket/base

(require rackunit rnrs/mutable-pairs-6 "3.23.rkt")

(define dq (make-deque))

((dq 'front-insert!) 'c)
((dq 'front-insert!) 'b)
((dq 'front-insert!) 'a)
(check-equal? ((dq 'empty?)) #f)
(check-equal? ((dq 'front)) 'a)
(check-equal? ((dq 'rear)) 'c)

((dq 'disp))

((dq 'rear-insert!) 'd)
((dq 'rear-insert!) 'e)
(check-equal? ((dq 'rear)) 'e)


((dq 'front-delete!))
((dq 'rear-delete!))
(check-equal? ((dq 'front)) 'b)
(check-equal? ((dq 'rear)) 'd)

((dq 'rear-delete!))
(check-equal? ((dq 'rear)) 'c)
