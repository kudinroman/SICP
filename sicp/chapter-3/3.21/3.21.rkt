#lang racket/base

(require rnrs/mutable-pairs-6 r5rs/init)

(define (front-ptr queue) (mcar queue))
(define (rear-ptr queue) (mcdr queue))

(define (set-front-ptr! queue item) (set-car! queue item))
(define (set-rear-ptr! queue item) (set-cdr! queue item))

(define (empty-queue? queue) (null? (front-ptr queue)))

(define (make-queue) (mcons '() '()))

(define (front-queue queue)
  (if (empty-queue? queue)
    (error "FRONT has beee invoked with empty queue" queue)
    (mcar (front-ptr queue))))

(define (insert-queue! queue item)
  (let ((new-pair (mcons item '())))
    (cond ((empty-queue? queue)
           (set-front-ptr! queue new-pair)
           (set-rear-ptr! queue new-pair)
           queue)
          (else
            (set-cdr! (rear-ptr queue) new-pair)
            (set-rear-ptr! queue new-pair)
            queue))))

(define (delete-queue! queue)
  (cond ((empty-queue? queue)
         (error "DELETE has been invoked with empty queue" queue))
         (else
           (set-front-ptr! queue (mcdr (front-ptr queue)))
           queue)))

(define (display-queue queue)
  (display (front-ptr queue))
  (display "\n"))

(provide make-queue insert-queue! delete-queue! empty-queue? display-queue front-ptr)

