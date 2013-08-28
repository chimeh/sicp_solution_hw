#lang racket
(define (term x y z) (/ x (+ y z)))

(define (cont-frac-rec n d k)
  (define (rec i)
    (if (= k i)
        (term (n k) (d k) (/ (n k) (d k)))
        (term (n i) (d i) (rec (+ i 1)))))
  (rec 1))

(define (cont-frac-iter n d k)
  (define (iter  i result)
    (if (= i 1)
        (term (n 1) (d 1) result)
        (iter  (- i 1) (term (n i) (d i) result))))
    (iter  k 0))

(cont-frac-rec (lambda (i) 1.0) (lambda (i) 1.0) 100)
(cont-frac-iter (lambda (i) 1.0) (lambda (i) 1.0) 100)

(/ 2 (+ (sqrt 5) 1))