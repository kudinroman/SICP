#lang racket/base

(require rnrs/mutable-pairs-6 r5rs/init)

(define (set-front-ptr! queue item) (set-car! queue item))
(define (set-rear-ptr! queue item) (set-cdr! queue item))

(define (make-queue)
  (let ((front-ptr '())
        (rear-ptr '()))
    (define (set-front-ptr! item) (set! front-ptr item))
    (define (set-rear-ptr! item) (set! rear-ptr item))
    (define (empty-queue?) (null? front-ptr))

    (define (front-queue)
      (if (empty-queue?)
        (error "FRONT has beee invoked with empty queue" front-ptr)
        (mcar front-ptr)))

    (define (insert-queue! item)
      (let ((new-pair (mcons item '())))
        (cond ((empty-queue?)
               (set-front-ptr! new-pair)
               (set-rear-ptr! new-pair)
               front-ptr)
              (else
                (set-cdr! rear-ptr new-pair)
                (set-rear-ptr! new-pair)
                front-ptr))))

    (define (delete-queue!)
      (cond ((empty-queue?)
             (error "DELETE has been invoked with empty queue" front-ptr))
             (else
               (set-front-ptr! (mcdr front-ptr))
               front-ptr)))

    (define (disp)
      (display front-ptr)
      (display "\n"))


    (define (dispatch m)
      (cond ((eq? m 'empty?) empty-queue?)
            ((eq? m 'front) front-queue)
            ((eq? m 'insert!) insert-queue!)
            ((eq? m 'delete!) delete-queue!)
            ((eq? m 'disp) disp)
            (else (error "Wrong message" m))))
  dispatch))

(provide make-queue)

