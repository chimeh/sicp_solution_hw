#lang racket
(define (filtered-accumulate combiner null-value term a next b filter)
    (if (> a b)
        null-value
        (if (filter a)
            (combiner (term a)
                      (filtered-accumulate combiner null-value term (next a) next b filter))
            (combiner null-value
                      (filtered-accumulate combiner null-value term (next a) next b filter)))))


(define (smallest-div n) 
    (define (divides? a b) 
      (= 0 (remainder b a)))
    (define (square x) (* x x))
    (define (find-div n test) 
       (cond ((> (square test) n) n) ((divides? test n) test) 
           (else (find-div n (+ test 1))))) 
    (find-div n 2))

(define (prime? n) 
    (if (= n 1) false (= n (smallest-div n)))) 

(define (self x) x)

(define (sum-prime a next b)
    (filtered-accumulate + 0 self a next b prime?))

(define (inc x) (+ x 1))
(sum-prime 1 inc 19)
;结果
;77
;(+ 2 3 5 7 11 13 17 19) 为77
    
    
    