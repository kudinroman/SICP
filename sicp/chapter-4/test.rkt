#lang racket/base

(require rackunit "interpreter.rkt")

;====================================================
;===== ENVIRONMENT
;====================================================

(check-equal? empty-env '())
(define base-env (setup-env))
(check-equal? (parent-env base-env) '())

(define extended-env 
  (extend-env (list '<= '>=) 
              (list (list 'primitive <=) (list 'primitive >=))
              base-env))

(check-equal? (first-frame (parent-env extended-env)) (first-frame base-env))
(check-equal? (get-var-value '>= extended-env) (list 'primitive >=))

(def-var! 'abs (list 'primitive angle) extended-env)
(check-equal? (get-var-value 'abs extended-env) (list 'primitive angle))

(set-var-value! 'abs (list 'primitive abs) extended-env)
(check-equal? (get-var-value 'abs extended-env) (list 'primitive abs))

;====================================================
;===== EVAL
;====================================================

(define (interpreter expr)
  (eval~ expr extended-env))

(check-equal? (interpreter '(+ 1 2)) 3)
(check-equal? (car (interpreter '(cons 1 2))) 1)
(check-equal? (interpreter '(abs -3)) 3)

(check-equal? (self-evaluating? "asdf") #t)
(check-equal? (self-evaluating? 111) #t)

(check-equal? (variable? 'a) #t)
(check-equal? (tagged-list? '(type asdf) 'type) #t)
(check-equal? (quoted? '(quote asdf)) #t)
(check-equal? (assignment? '(set! var-name 'value)) #t)
(check-equal? (definition? '(define var-name 'value)) #t)
(check-equal? (if? '(if #t 1 2)) #t)
(check-equal? (lambda? '(lambda x x)) #t)
(check-equal? (begin? '(begin 2 3)) #t)
(check-equal? (cond? '(cond 'any-content)) #t)
(check-equal? (application? '(list)) #t)

(define lambda-call '((lambda (a) (+ a 1)) 1))
(check-equal? (interpreter lambda-call) 2)

(define factorial-of-six
  '(
    (define (fac n)
      (if (= n 1)
          1
          (* n (fac (- n 1)))))
    (fac 6)
    ))
(check-equal? (interpreter factorial-of-six) 720)

(define closure
  '(
    (define (clos-sum a)
      (lambda (b) (+ a b)))
    (define fn (clos-sum 1))
    (fn 1)
    ))
(check-equal? (interpreter closure) 2)

(define simple-let
  '(let ((a (+ 1 0))
         (b (+ 0 2)))
     (+ a b)))
(check-equal? (interpreter simple-let) 3)

(define complex-let
  '(let* ((a 1)
          (b (+ a 1)))
     (+ a b)))
(check-equal? (interpreter complex-let) 3)

(define complex-let-with-set
  '(let* ((a 1)
          (b (set! a 2)))
     a))
(check-equal? (interpreter complex-let-with-set) 2)

(define counter
  '(
    (define a 1)
    (define (get-counter)
      (lambda () (set! a 2)))
    (define count (get-counter))
    (count)
    a
    ))
(check-equal? (interpreter counter) 2)

(define complex-counter
  '(
    (define (get-counter start)
      (lambda () ((set! start (+ start 1)) start)))
    (define count (get-counter 0))
    (count)
    (count)
    ))
(check-equal? (interpreter complex-counter) 2)






