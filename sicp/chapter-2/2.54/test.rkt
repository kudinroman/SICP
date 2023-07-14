#lang racket/base

(require rackunit "2.54.rkt")

(check-equal? (my-equal? '(this is a list) '(this is a list)) #t)
(check-equal? (my-equal? '(this is a list) '(this (is a) list)) #f)
(check-equal? (my-equal? '(this is a list) '((this) is a list)) #f)
