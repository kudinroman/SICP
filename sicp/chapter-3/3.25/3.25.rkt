#lang racket/base

(require rnrs/mutable-pairs-6 compatibility/mlist)

(define (make-table)
  (define table '())

  (define (lookup keys)
    (let ((record (assoc keys table)))
      (and record (cadr record))))

  (define (insert keys value)
    (let ((record (assoc keys table)))
      (cond (record (set-car! (cdr record) value))
            (else (set! table (cons (list keys value) table))))))

  (define (show) (display table))

  (define (dispatch m)
    (cond ((eq? m 'lookup) lookup)
          ((eq? m 'insert) insert)
          ((eq? m 'show) show)
          (else (error "Unknown request -- NTABLE" m))))
  dispatch)

(define (insert! nt keys value)  
  ((nt 'insert) keys value) value)

(define (lookup  nt keys)
  ((nt 'lookup) keys))

(define (show t) ((t 'show)))

(provide make-table insert! lookup show)
