#lang racket/base

(require rackunit rnrs/mutable-pairs-6 "3.21.rkt")

(define q1 (make-queue))

(check-equal? (empty-queue? q1) #t)

(display-queue (insert-queue! q1 'a))
(display-queue (insert-queue! q1 'b))
(display-queue (insert-queue! q1 'c))

(check-equal? (empty-queue? q1) #f)

(display-queue (delete-queue! q1))

(check-equal? (front-ptr q1) (mcons 'b (mcons 'c '())))

