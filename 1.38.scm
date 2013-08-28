#lang racket
(define (term x y z) (/ x (+ y z)))

(define (cont-frac-rec n d k)
  (define (rec i)
  (if (= i k)
      (term (n k) (d k) 0)
      (term (n i) (d i) (rec  (+ i 1)))))
  (rec 1))

(define (cont-frac-iter n d k)
  (define (iter  i result)
    (if (= i 1)
        (term (n 1) (d 1) result)
        (iter  (- i 1) (term (n i) (d i) result))))
    (iter  k 0))



(define d (lambda (di)
            (if (= (remainder di 3) 2)
                (+ 2 (* 2 (quotient di 3)))
                1)))

(define n (lambda (nk) 1.0))

 

(define euler-rec (lambda (k) (+ 2 (cont-frac-iter n d k))))
(euler-rec 1000)

(define euler-iter (lambda (k) (+ 2 (cont-frac-iter n d k))))
(euler-iter 1000)


;2.7182818284590455
;2.7182818284590455