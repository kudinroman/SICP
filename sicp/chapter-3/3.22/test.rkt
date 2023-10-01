#lang racket/base

(require rackunit rnrs/mutable-pairs-6 "3.22.rkt")

(define q (make-queue))

((q 'insert!) 'a)
((q 'insert!) 'b)
((q 'insert!) 'c)
(check-equal? ((q 'empty?)) #f)
(check-equal? ((q 'front)) 'a)

((q 'disp))

((q 'delete!))
((q 'delete!))
(check-equal? ((q 'empty?)) #f)
(check-equal? ((q 'front)) 'c)

((q 'delete!))
(check-equal? ((q 'empty?)) #t)
