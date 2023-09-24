#lang racket/base

(define f
  (let ((init 0)) 
    (lambda (x)  
      (set! init (- x init))  
      (- x init)))) 
(provide f)

