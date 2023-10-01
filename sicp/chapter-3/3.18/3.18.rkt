#lang racket/base

(require rnrs/mutable-pairs-6)

(define (disp label value)
  (display label)
  (display value)
  (display "\n"))

(define (is-loop? l) 
  (let ((used (list))) 
    (define (func x) 
      (disp "X: " x)
      (cond ((not (mpair? x)) #f)
            ((memq x used)
             (begin
               (disp "Duplicate: " x)
               #t))
            (else
              (or 
                (begin 
                  (set! used (cons x used)) 
                  (func (mcdr x)))
                #f))))
    (func l)))

(provide is-loop?)

