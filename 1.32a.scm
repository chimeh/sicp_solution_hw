#lang racket
(define (accumulate combiner null-value term a next b)
    (if (> a b)
        null-value
        (combiner (term a)
                  (accumulate combiner null-value term (next a) next b))))
                  
(define (sum term a next b) (accumulate + 0 term  a next b))
(define (product term a next b) (accumulate * 1 term a next b))

;测试sum
(define (cube x) (* x x x))
(define (intergral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(intergral cube 0 2 0.01)

;结果
;3.9999500000000046

;测试product
(define (inc x) (+ x 1))
(product cube 3 inc 6)
(* (cube 3) (cube 4) (cube 5) (cube 6))
;结果
; 46656000
; 46656000