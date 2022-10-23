#lang racket/base
        
(define (same-parity l)
  (let ((yes? (if (odd? (car l)) odd? even?)))
  (define (same-parity-iter l result)
    (if   (null? l)
          (reverse result)
          (same-parity-iter   (cdr l)
                              (if   (yes? (car l))
                                    (cons (car l) result)
                                    result))))
  (same-parity-iter l `())))

(provide
  same-parity
)