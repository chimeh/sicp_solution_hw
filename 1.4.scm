#lang racket
;习题1.4
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
; This procedure receives two arguments, namely a and b, and
; returns the sum of a and the absolute value of b
(a-plus-abs-b 5 -8)