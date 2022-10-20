#lang racket/base

(require rackunit "2.4.rkt")

(define Smith (cons* "John" "Jane"))
(define husbunt (car* Smith))
(define wife (cdr* Smith))

(check-equal? husbunt "John")
(check-equal? wife "Jane")