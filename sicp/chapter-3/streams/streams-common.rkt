#lang racket/base

(require rnrs/mutable-pairs-6 compatibility/mlist)

(define (memo-proc proc)
  (let ((already-run? #f) (result #f))
    (lambda ()
      (if (not already-run?)
        (begin (set! result (proc))
               (set! already-run? #t)
               (display-line proc)
               result)
        result))))

(define (my-force delayed-object)
  (delayed-object))

(define (my-delay proc)
  (memo-proc (lambda () proc)))

(define (cons-stream a b) (cons a (my-delay b)))
(define (stream-car stream) (car stream))
(define (stream-cdr stream) (my-force (cdr stream)))

(define (stream-enumerate-interval low high)
  (if (> low high)
    '()
    (cons-stream
      low
      (stream-enumerate-interval (+ low 1) high))))

(define (enumerate-interval low high)
  (if (> low high)
    '()
    (cons
      low
      (enumerate-interval (+ low 1) high))))


(define (my-stream-for-each proc s)
  (if (null? s)
    'done
    (begin (proc (stream-car s))
           (my-stream-for-each proc (stream-cdr s)))))

(define (for-each proc s)
  (if (null? s)
    'done
    (begin (proc (car s))
           (for-each proc (cdr s)))))

(define (display-stream s)
  (my-stream-for-each display-line s))

(define (display-enum s)
  (for-each display-line s))

(define (display-line x)
  (newline)
  (display x))

(define (my-stream-filter pred stream)
  (cond ((null? stream) '())
        ((pred (stream-car stream))
         (cons-stream (stream-car stream)
                      (my-stream-filter pred
                                     (stream-cdr stream))))
        (else (my-stream-filter pred (stream-cdr stream)))))

(define (filter pred l)
  (cond ((null? l) l)
        ((pred (car l))
         (cons (car l)
               (filter pred (cdr l))))
        (else (filter pred (cdr l)))))

(stream-car
  (stream-cdr
    (my-stream-filter (lambda (x) (< x 5))
                   (stream-enumerate-interval 1 100000000))))

(car
  (cdr
    (filter (lambda (x) (< x 5))
                   (enumerate-interval 1 10))))

(provide 
  display-line
  memo-proc
  my-force
  my-delay
  )

