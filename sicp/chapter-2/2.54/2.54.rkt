#lang racket/base
(require rackunit "../common.rkt")
(require math/number-theory)

(define (my-equal? list1 list2) 
 (cond ((and (not (pair? list1)) (not (pair? list2))) 
        (eq? list1 list2)) 
       ((and (pair? list1) (pair? list2)) 
        (and (equal? (car list1) (car list2)) (my-equal? (cdr list1) (cdr list2)))) 
       (else #f))) 

(provide
  my-equal?
  )
