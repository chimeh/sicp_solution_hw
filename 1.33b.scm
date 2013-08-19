#lang racket
(define (filtered-accumulate combiner null-value term a next b filter)
    (if (> a b)
        null-value
        (if (filter a)
            (combiner (term a)
                      (filtered-accumulate combiner null-value term (next a) next b filter))
            (combiner null-value
                      (filtered-accumulate combiner null-value term (next a) next b filter)))))


(define (gcd m n) 
  (cond ((< m n) (gcd n m))
        ((= n 0) m) 
        (else (gcd n (remainder m n))))) 
 
(define (relative-prime? m n)
(= (gcd m n) 1)) 

(define (self x) x)
(define (inc x) (+ x 1))
;product of relative-prime with n in set(positive less than n)
(define (product-relative-prime n)
    (define (filter x)
        (relative-prime? x n))
    (filtered-accumulate * 1 self 1 inc n filter))

(product-relative-prime 20)
;结果
;8729721
(* 3 7 9 11 13 17 19 ) ;为8729721
    
    
    