#lang racket/base

(define (reverse-rec l)
  (if   (null? l)
        `()
        (append (reverse-rec (cdr l)) (list (car l)))))

(define (reverse-iter l)
  (define (reverse-iter l result)
    (if   (null? (cdr l))
          (cons (car l) result)
          (reverse-iter (cdr l) (cons (car l) result))))
  (reverse-iter l `()))

(provide
  reverse-rec
  reverse-iter
)