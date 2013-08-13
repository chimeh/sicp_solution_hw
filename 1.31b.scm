#lang racket

;习题1.31b
(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))
  (iter a 1))

(define (inc x) (+ x 1))
(define (self x) x)

(define (factorial n)
  (product-iter self 1 inc n))

(define (sqrtc x) (* x x))
(define (add2 x) (+ x 2))
(define (piterm x) (/ (sqrtc (inc x)) (sqrtc x)))

(define (qtrpi n) 
  (/ (* 2
        (product-iter piterm 3 add2 n))
     n))
     
  
(define pipi (* 4.0 (qtrpi 10000)))

;test
(factorial 8)
pipi
      