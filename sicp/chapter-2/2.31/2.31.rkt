#lang racket/base

(define (square x) (* x x))
(define (inc x) (+ x 1))

(define (square-tree tree) (tree-map square tree))
(define (inc-tree tree) (tree-map inc tree))

(define (tree-map func tree)
  (map  (lambda (sub-tree)
          (if   (pair? sub-tree)
                (tree-map func sub-tree)
                (func sub-tree)))
        tree))

(provide
  square-tree
  inc-tree
)
