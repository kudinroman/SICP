#lang racket/base

(define (square x) (* x x))

(define (square-tree tree)
  (cond   ((null? tree) tree)
          ((not (pair? tree)) (* tree tree))
          (else (cons   (square-tree (car tree))
                        (square-tree (cdr tree))))))

(define (square-tree-map tree)
  (map  (lambda (sub-tree)
          (if   (pair? sub-tree)
                (square-tree-map sub-tree)
                (square sub-tree)))
        tree))

(provide
  square-tree
  square-tree-map
)
