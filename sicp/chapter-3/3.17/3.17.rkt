#lang racket/base

(require compatibility/mlist rnrs/mutable-pairs-6)

(define (disp label value)
  (display label)
  (display value)
  (display "\n"))

(define (count-pairs x) 
  (disp "X: " x)
  (let ((used (list))) 
    (define (func x) 
      (cond ((not (mpair? x))
             (begin (disp "Not pair: " x)
                    0))
            ((memq x used)
             (begin (disp "Duplicate: " x)
                    0))
            (else
              (begin 
                (set! used (cons x used)) 
                (disp "Counted: " x)
                (+ (func (mcar x)) 
                   (func (mcdr x)) 
                   1)))))
    (func x))) 

(provide count-pairs)

