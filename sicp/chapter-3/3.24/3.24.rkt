#lang racket/base

(require rnrs/mutable-pairs-6 compatibility/mlist)


(define (make-table same-key?)
  (let ((local-table (mcons '*table* null)))
    (define (lookup key-1 key-2)
      (let ((subtable (assoc key-1 (mcdr local-table))))
        (if subtable
          (let ((record (assoc key-2 (mcdr subtable))))
            (if record
              (mcdr record)
              #f))
          #f)))

    (define (assoc key records)
      (cond ((null? records) #f)
            ((same-key? key (mcar (mcar records))) (mcar records))
            (else (assoc key (mcdr records)))))


    (define (insert! key-1 key-2 value)
      (let ((subtable (assoc key-1 (mcdr local-table))))
        (if subtable
          (let ((record (assoc key-2 (mcdr subtable))))
            (if record
              (set-mcdr! record value)
              (set-mcdr! subtable
                        (mcons (mcons key-2 value)
                              (mcdr subtable)))))
          (set-mcdr! local-table
                    (mcons (mcons key-1
                                (mcons (mcons key-2 value) null))
                          (mcdr local-table)))))
      local-table)

    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) lookup)
            ((eq? m 'insert-proc!) insert!)
            (else (error "Unknown proc" m))))
    dispatch))

(provide make-table)
