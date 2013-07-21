#lang racket
;不好理解～～～
(define (enven? n) (remainder n 0))

(define (square n) (* n n))

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (expmod-a base exp m)
  (remainder (fast-expt base exp) m))

(define (expmod-b base exp m)
  (cond ((= exp 0) 1)  
        ((even? exp)
          (remainder (square (expmod-b base (/ exp 2) m)) m))
        (else
          (remainder (* base (expmod-b base (- exp 1) m)) m))))

(expmod-a 3 20 19)

(expmod-b 3 20 19)