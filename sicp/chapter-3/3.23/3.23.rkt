#lang racket/base

(require rnrs/mutable-pairs-6 r5rs/init)

(define (set-front-ptr! queue item) (set-car! queue item))
(define (set-rear-ptr! queue item) (set-cdr! queue item))

(define (make-deque)
  (let ((front-ptr '())
        (rear-ptr '()))
    (define (set-front-ptr! item) (set! front-ptr item))
    (define (set-rear-ptr! item) (set! rear-ptr item))
    (define (empty-deque?) (null? front-ptr))

    (define (front)
      (if (empty-deque?)
        (error "FRONT has beee invoked with empty queue" front-ptr)
        (mcar front-ptr)))

    (define (rear)
      (if (empty-deque?)
        (error "REAR has beee invoked with empty queue" rear-ptr)
        (mcar rear-ptr)))

    (define (front-insert! item)
      (let ((new-pair (mcons item front-ptr)))
        (cond ((empty-deque?)
               (set-front-ptr! new-pair)
               (set-rear-ptr! new-pair)
               front-ptr)
              (else
                (set! front-ptr new-pair)
                front-ptr))))

    (define (rear-insert! item)
      (let ((new-pair (mcons item '())))
        (cond ((empty-deque?)
               (set-front-ptr! new-pair)
               (set-rear-ptr! new-pair)
               front-ptr)
              (else
                (set-cdr! rear-ptr new-pair)
                (set-rear-ptr! new-pair)
                front-ptr))))

    (define (front-delete!)
      (cond ((empty-deque?)
             (error "DELETE has been invoked with empty queue" front-ptr))
             (else
               (set-front-ptr! (mcdr front-ptr))
               front-ptr)))

    (define (rear-delete!)
      (cond ((empty-deque?)
             (error "DELETE has been invoked with empty queue" front-ptr))
             (else
               (set-rear-ptr! (mcons (mcar (arbitrary-cdr (- (length front-ptr) 2) front-ptr)) null))
               (set-cdr! (arbitrary-cdr (- (length front-ptr) 2) front-ptr) null)
               front-ptr)))

    (define (disp)
      (display front-ptr)
      (display "\n"))

    (define arbitrary-cdr
      (lambda (num xs)
        (if (= num 0)
            xs
            (arbitrary-cdr (- num 1) (mcdr xs)))))


    (define (dispatch m)
      (cond ((eq? m 'empty?) empty-deque?)
            ((eq? m 'front) front)
            ((eq? m 'rear) rear)
            ((eq? m 'front-insert!) front-insert!)
            ((eq? m 'rear-insert!) rear-insert!)
            ((eq? m 'front-delete!) front-delete!)
            ((eq? m 'rear-delete!) rear-delete!)
            ((eq? m 'disp) disp)
            (else (error "Wrong message" m))))
  dispatch))

(provide make-deque)

