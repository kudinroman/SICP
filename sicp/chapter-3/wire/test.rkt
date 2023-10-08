#lang racket/base

(require rackunit "wire.rkt" rnrs/mutable-pairs-6 compatibility/mlist)

(define (disp pair)
  (display (car pair)) 
  (display ": ") 
  (display (get-signal (cdr pair)))
  (display "\n"))

(define (display-signals l)
  (if (null? l)
    (display "\n")
    (begin (disp (car l))
           (display-signals (cdr l)))))

(define input-1 (make-wire))
(define input-2 (make-wire))
(define sum (make-wire))
(define carry (make-wire))

(define signals (list (cons "S1" input-1)
                       (cons "S2" input-2)
                       (cons "Sum" sum)
                       (cons "Carry" carry)))

(probe 'input-1 sum)
(probe 'input-2 sum)
(probe 'sum sum)
(probe 'carry carry)

(half-adder input-1 input-2 sum carry)

(set-signal! input-1 1)
(propagate)

(display-signals signals)

(set-signal! input-2 1)
(propagate)

(display-signals signals)
