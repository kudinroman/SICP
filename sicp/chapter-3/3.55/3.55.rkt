#lang racket/base

(require 
  racket/stream
  "../stream-common.rkt" 
  )

(define (streams-map op . streams)
  (if (null? streams)
      (empty-stream)
      (stream-cons
        (apply op (map stream-first streams))
        (apply streams-map (cons op (map stream-rest streams))))))

(define (add-streams s1 s2)
  (streams-map + s1 s2))

(define (mul-streams s1 s2)
  (streams-map * s1 s2))

(provide add-streams mul-streams)
