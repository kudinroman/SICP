#lang racket/base

(define (for-each func items)
  (if  (null? items)
       #t
       (and   (func (car items))
              (for-each func (cdr items)))))

(define (my-display x)
        (display x)
        (newline))

(provide
  for-each
  my-display
)
