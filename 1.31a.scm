#lang racket

;习题1.31a
(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (inc x) (+ x 1))
(define (self x) x)

(define (factorial n)
  (product self 1 inc n))

(define (sqrtc x) (* x x))
(define (add2 x) (+ x 2))
(define (piterm x) (/ (sqrtc (inc x)) (sqrtc x)))

(define (qtrpi n) 
  (/ (* 2
        (product piterm 3 add2 n))
     n))
     
  
(define pipi (* 4 (qtrpi 1)))

;test
(factorial 8)
(piterm 3)
pipi
      