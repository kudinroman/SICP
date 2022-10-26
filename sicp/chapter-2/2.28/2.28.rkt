#lang racket/base

(define (fringe x) 
  (if (pair? (car x)) 
      (append (fringe (car x))
              (fringe (cadr x))) 
      (append (list (car x))
              (cdr x))))

(provide
  fringe
)
