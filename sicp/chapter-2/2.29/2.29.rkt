#lang racket/base

(define (make-mobile left right)
  (cons left right))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cdr mobile))

;===================================
(define (make-branch length structure)
  (cons length structure))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cdr branch))


;===================================
(define (total-weight mobile)
  (+  (get-branch-weight (left-branch mobile))
      (get-branch-weight (right-branch mobile))))

(define (total-weight-balanced mobile)
  (+  (get-branch-weight-balanced (left-branch mobile))
      (get-branch-weight-balanced (right-branch mobile))))

(define (get-weight branch func)
    (if   (pair? (branch-structure branch))
          (total-weight (branch-structure branch))
          (func branch)))

(define (get-branch-weight branch)
  (get-weight   branch
                (lambda (b)
                (branch-structure b))))

(define (get-branch-weight-balanced branch)
  (get-weight   branch
                (lambda (b)
                  (* (branch-length b) (branch-structure b)))))

(define (mobile-balanced? mobile)
  (=  (get-branch-weight-balanced (left-branch mobile))
      (get-branch-weight-balanced (right-branch mobile))))

(provide
  make-mobile
  left-branch
  right-branch

  make-branch
  branch-length
  branch-structure

  total-weight
  total-weight-balanced

  mobile-balanced?
)
