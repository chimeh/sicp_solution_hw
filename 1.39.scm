#lang racket
(define (term x k sub)
  (/ (* x x)
     (- (- (* 2 k) 1)
        sub)))

(define (tan-cf x k)
  (define (rec i) (if (= i k)
                      (term x k 0)
                      (term x i (rec (+ i 1)))))
  (/ (rec 1) x))

(tan-cf (/ 3.141592657 6.0) 10000)
(/ 1 (sqrt 3))

;0.577350257280783
;0.57735026918962583