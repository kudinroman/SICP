#lang racket/base

(define (delay o) (lambda () o))
(define (force o) (o))

(define (cons-stream a b) (cons a (delay b)))
(define (stream-car s) (car s))
(define (stream-cdr s) (force (cdr s)))

(define (the-empty-stream) '())
(define (stream-null? s) (eq? s '()))

(define (stream-enumerate-interval low high)
  (if (> low high)
    (the-empty-stream)
    (cons-stream
      low
      (stream-enumerate-interval (+ low 1) high))))

(define (display-line x)
  (newline)
  (display x))

(define (my-stream-filter pred stream)
  (cond ((stream-null? stream) (the-empty-stream))
        ((pred (stream-car stream))
         (cons-stream (stream-car stream)
                      (my-stream-filter pred (stream-cdr stream))))
        (else (my-stream-filter pred (stream-cdr stream)))))

(define (pred-func? x) (begin (display-line x) (< x 5)))

(define (my-stream-for-each proc s)
  (if (stream-null? s)
    'done
    (begin (proc (stream-car s))
           (my-stream-for-each proc (stream-cdr s)))))

(define (display-stream s)
  (my-stream-for-each display-line s))

(define (my-stream-map proc . argstreams)
  (if (stream-null? (car argstreams))
    (the-empty-stream)
    (cons-stream
      (apply proc (map stream-car argstreams))
      (apply my-stream-map
             (cons proc (map stream-cdr argstreams))))))

(define (my-stream-ref s n)
  (if (= n 0)
    (stream-car s)
    (my-stream-ref (stream-cdr s) (- n 1))))


#| (display-line (stream-car |#
#|   (stream-cdr |#
#|     (my-stream-filter pred-func? |#
#|                       (stream-enumerate-interval 1 100000000000000))))) |#

(define (show x) (display-line x) x)

(provide 
  display-line
  stream-enumerate-interval
  show
  stream-null?
  the-empty-stream
  cons-stream
  stream-car
  stream-cdr
  display-stream
  my-stream-map
  my-stream-ref
  my-stream-filter
  )

