#lang racket
;习题1.7
;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
; The first three lines of this file were inserted by DrRacket. They record metadata
; about the language level of this file in a form that our tools can easily process.
(define (good_enough x guess) (< (abs (- guess
                                         (improve guess x)))
                                 0.000001))

(define (improve guess x) (/  (+ guess (/ x guess)) 2 ))
  
(define (sqrt_iter x guess) (cond ((good_enough x guess) guess)
                                  (else  (sqrt_iter x (improve guess x)))))
  
(define (sqrtt x) (sqrt_iter x 1))

(sqrtt 10000)
(sqrtt 10000.0)
  
  