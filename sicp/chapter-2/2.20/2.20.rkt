#lang racket/base
        
(define (same-parity first . rest)
  (let ((yes? (if (odd? first) odd? even?)))
  (define (same-parity-iter l result)
    (if   (null? l)
          (reverse result)
          (same-parity-iter   (cdr l)
                              (if   (yes? (car l))
                                    (cons (car l) result)
                                    result))))
  (same-parity-iter rest (list first))))

(provide
  same-parity
)