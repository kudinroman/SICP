#lang racket/base

(define (square x) (* x x))

(define (square-list1 items)
  (if   (null? items)
        items
        (cons (square (car items)) (square-list1 (cdr items)))))

(define (square-list2 items)
  (map square items))

(provide
  square-list1
  square-list2
)

(define (for-each func items)
  ((func (car items))
   (for-each (cdr items))))