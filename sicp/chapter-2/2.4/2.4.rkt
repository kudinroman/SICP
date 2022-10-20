#lang racket/base

(define (cons* a b) (lambda (x) (x a b)))
(define (car* z) (z (lambda (a b) a)))
(define (cdr* z) (z (lambda (a b) b)))

(provide cons* car* cdr*)