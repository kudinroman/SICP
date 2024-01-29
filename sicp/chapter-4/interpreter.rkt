#lang racket/base

(require rnrs/mutable-pairs-6)

;====================================================
;===== PRIMITIVES
;====================================================

(define primitive-procedures
  (list (list '+ +)
        (list '- -)
        (list '* *)
        (list '/ /)
        (list '> >)
        (list '< <)
        (list '= =)
        (list 'cons cons)
        (list 'car car)
        (list 'cdr cdr)
        (list 'list list)
        (list 'null? null?)))
(define primitive-names (map car primitive-procedures))

(define primitive-values
  (map (lambda (proc) (list 'primitive (cadr proc))) 
       primitive-procedures))


;====================================================
;===== ENVIRONMENT
;====================================================

(define (parent-env env) (cdr env))
(define (first-frame env) (car env))
(define empty-env '())

(define (make-frame keys vals)
  (if (= (length keys) (length vals))
    (let ((table (make-hash)))
      (define (insert-loop keys vals)
        (cond ((not (null? keys))
               (hash-set! table (car keys) (car vals))
               (insert-loop (cdr keys) (cdr vals)))
              (else table)))
      (insert-loop keys vals))
    (error "Wrong number of keys and values")))

(define (extend-env vars vals base-env)
    (cons (make-frame vars vals) base-env))

(define (get-var-value var env)
  (define (scan current-env)
    (if (eq? current-env empty-env)
      (error "Unbound variable" var)
      (let ((frame (first-frame current-env)))
          (if (hash-has-key? frame var)
            (hash-ref frame var)
              (scan (parent-env current-env))))))
  (scan env))

(define (set-var-value! var val env)
  (let ((frame (first-frame env)))
    (if (null? frame)
      (error "Unbound variable" var)
      (if (hash-has-key? frame var)
        (hash-set! frame var val)
        (set-var-value! var val (parent-env env))))))

(define (def-var! var val env)
  (let ((frame (first-frame env)))
    (hash-set! frame var val)))

(define (setup-env)
  (let ((env (extend-env primitive-names primitive-values empty-env)))
    env))

;====================================================
;===== EVAL
;====================================================

(define (eval~ expr env)
  (displayln env)
  (cond ((self-evaluating? expr) expr)
        ((variable? expr) (get-var-value expr env))
        ((quoted? expr) (text-of-quotation expr))
        ((definition? expr) (eval-definition expr env))
        ((assignment? expr) (eval-assignment expr env))
        ((let? expr) (eval~ (let->combination expr) env))
        ((let*? expr) (eval~ (let*->nested-lets expr) env))
        ((if? expr) (eval-if expr env))
        ((seq? expr) (eval-seq expr env))
        ((lambda? expr) (make-procedure (lambda-parameters expr)
                                        (lambda-body expr)
                                        env))
        ((begin? expr) (eval-sequence (begin-actions expr) env))
        ((cond? expr) (eval~ (cond->if expr) env))
        ((application? expr) (apply~ (eval~ (operator expr) env)
                                    (list-of-values (operands expr) env)))
        (else (error "Unknown expression type -- EVAL" expr))))


(define (apply~ proc args)
  (cond ((primitive-procedure? proc)
         (apply-primitive-procedure proc args))
        ((compound-procedure? proc)
         (eval~ (procedure-body proc)
                (extend-env (procedure-parameters proc)
                            args
                            (procedure-environment proc))))
        (else (error "Unknown procedure type -- APPLY" proc))))

(define (list-of-values exps env)
  (if (no-operands? exps)
    '()
    (cons (eval~ (first-operand exps) env)
          (list-of-values (rest-operands exps) env))))

(define (eval-if expr env)
  (if (true? (eval~ (if-predicate expr) env))
    (eval~ (if-consequent expr) env)
    (eval~ (if-alternative expr) env)))

(define (eval-sequence exps env)
  (cond ((last-exp? exps) (eval~ (first-exp exps) env))
        (else (eval~ (first-exp exps) env)
              (eval-sequence (rest-exps exps) env))))

(define (eval-seq expr env)
  (cond ((null? (cdr expr))
         (eval~ (car expr) env))
        (else
          (eval~ (car expr) env)
          (eval-seq (cdr expr) env))))

(define (eval-assignment expr env)
  (let ((var (assignment-variable expr))
        (val (eval~ (assignment-value expr) env)))
    (set-var-value! var val env)
    'ok))


(define (eval-definition expr env)
  (let ((var (definition-var expr))
        (val (eval~ (definition-value expr) env)))
    (def-var! var val env)
    'ok))

(define (self-evaluating? expr)
  (cond ((number? expr) #t)
        ((string? expr) #t)
        (else #f)))

(define (variable? expr) (symbol? expr))

(define (seq? expr)
  (and (pair? expr)
       (pair? (car expr))
       (not (lambda? (car expr)))))

(define (quoted? expr) (tagged-list? expr 'quote))
(define (text-of-quotation expr) cadr expr)

(define (tagged-list? expr tag)
  (if (pair? expr)
    (eq? (car expr) tag)
    #f))

(define (assignment? expr) (tagged-list? expr 'set!))
(define (assignment-variable expr) (cadr expr))
(define (assignment-value expr) (caddr expr))

(define (definition? expr) (tagged-list? expr 'define))
(define (definition-var expr)
  (if (pair? (cadr expr))
    (caadr expr)
    (cadr expr)))
(define (definition-value expr)
  (if (pair? (cadr expr))
    (make-lambda (cdadr expr)
                 (caddr expr))
    (caddr expr)))

(define (let? expr) (tagged-list? expr 'let)) 
(define (let-vars expr) (map car (cadr expr))) 
(define (let-inits expr) (map cadr (cadr expr))) 
(define (let-body expr) (caddr expr))

(define (let->combination expr) 
  (cons (make-lambda (let-vars expr) (let-body expr)) 
        (let-inits expr)))

(define (let*? expr) (tagged-list? expr 'let*)) 
(define (let*-body expr) (caddr expr)) 
(define (let*-inits expr) (cadr expr)) 
(define (let*->nested-lets expr) 
  (let ((inits (let*-inits expr)) 
        (body (let*-body expr))) 
    (define (make-lets exprs) 
      (if (null? exprs) 
        body 
        (list 'let (list (car exprs)) (make-lets (cdr exprs))))) 
    (make-lets inits)))

(define (lambda? expr) (tagged-list? expr 'lambda))
(define (lambda-parameters expr) (cadr expr))
(define (lambda-body expr) (caddr expr))
(define (make-lambda parameters body)
  (list 'lambda parameters body))

(define (if? expr) (tagged-list? expr 'if))
(define (if-predicate expr) (cadr expr))
(define (if-consequent expr) (caddr expr))
(define (if-alternative expr)
  (if (not (null? (caddr expr)))
    (cadddr expr)
    'false))
(define (make-if predicate consequent alternative)
  (list 'if predicate consequent alternative))

(define (begin? expr) (tagged-list? expr 'begin))
(define (begin-actions expr) (cdr expr))
(define (last-exp? seq) (null? (cdr seq)))
(define (first-exp seq) (car seq))
(define (rest-exps seq) (cdr seq))
(define (sequence->exp seq)
  (cond ((null? seq) seq)
        ((last-exp? seq) (first-exp seq))
        (else (make-begin seq))))
(define (make-begin seq) (cons 'begin seq))

(define (application? expr) (pair? expr))
(define (operator expr) (car expr))
(define (operands expr) (cdr expr))
(define (no-operands? ops) (null? ops))
(define (first-operand ops) (car ops))
(define (rest-operands ops) (cdr ops))

(define (cond? expr) (tagged-list? expr 'cond))
(define (cond-clauses expr) (cdr expr))
(define (cond-else-clause? clause) (eq? (cond-predicate clause) 'else))
(define (cond-predicate clause) (car clause))
(define (cond-actions clause) (cdr clause))
(define (cond->if expr) (expand-clauses (cond-clauses expr)))

(define (expand-clauses clauses)
  (if (null? clauses)
    'false
    (let ((first (car clauses))
          (rest (cdr clauses)))
      (if (cond-else-clause? first)
        (if (null? rest)
          (sequence->exp (cond-actions first))
          (error "Branch ELSE is not a last -- COND->IF" clauses))
        (make-if (cond-predicate first)
                 (sequence->exp (cond-actions first))
                 (expand-clauses rest))))))

(define (true? expr) (not (eq? expr #f)))
(define (false? expr) (eq? expr #f))

(define (make-procedure params body env) (list 'procedure params body env))
(define (compound-procedure? proc) (tagged-list? proc 'procedure))
(define (procedure-parameters proc) (cadr proc))
(define (procedure-body proc) (caddr proc))
(define (procedure-environment proc) (cadddr proc))

(define (primitive-procedure? proc) (tagged-list? proc 'primitive))
(define (primitive-implementation proc) (cadr proc))

(define (apply-primitive-procedure proc args) (apply (primitive-implementation proc) args))

(define (user-print object)
  (if (compound-procedure? object)
    (display (list 'compound-procedure
                   (procedure-parameters object)
                   (procedure-body object)
                   '<procedure-env>))
    (display object)))

(provide
  primitive-names
  primitive-values
  empty-env
  parent-env
  first-frame
  make-frame
  extend-env
  get-var-value
  set-var-value!
  def-var!
  setup-env

  eval~

  self-evaluating?
  variable?
  tagged-list?
  quoted?
  assignment?
  definition?
  if?
  lambda?
  begin?
  cond?
  application?
  user-print
  )




