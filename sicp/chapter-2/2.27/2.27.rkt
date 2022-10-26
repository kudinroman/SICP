#lang racket/base

(define (reverse l)
  (if   (null? l)
        `()
        (append (reverse (cdr l)) (list (car l)))))

(define (deep-reverse l)
  (cond   ((null? l) l)
          ((pair? (car l)) (list (deep-reverse (cadr l)) (deep-reverse (car l))))
          (else (append (reverse (cdr l)) (list (car l))))))

(define (deep-reverse-1 x) 
  (if (pair? x) 
      (append (deep-reverse-1 (cdr x))  
              (list (deep-reverse-1 (car x)))) 
      x)) 

(provide
  reverse
  deep-reverse
  deep-reverse-1
)
