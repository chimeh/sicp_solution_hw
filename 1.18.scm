;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader{lib "htdp-advanced-reader.ss" "lang"}{{modname |1.18|} {read-case-sensitive #t} {teachpacks ()} {htdp-settings #(#t constructor repeating-decimal #t #t none #t ())}}

;习题1.18
;fast version mul, use tree iteration 
(define (mul-tree-iter a b)
    (mul-tree-iter-rel a b 0))
    
(define (mul-tree-iter-rel a counter reslt)
     (if (= counter 0)
         reslt
         (if (even? counter)
             (mul-tree-iter-rel (double a) (halve counter)  reslt)
             (mul-tree-iter-rel a (- counter 1) (plus a reslt)))))

(define (double x) (* x 2))
(define (halve x) (/ x 2))
(define (plus x y) (+ x y))

(mul-tree-iter 5 9)

; (mul-tree-iter 5 9)
; (mul-tree-iter-rel 5 9 0)
;  (plus 5 0)
; (mul-tree-iter-rel 5 8 5)
;  (double 5)
;  (halve 8)
; (mul-tree-iter-rel 10 4 5)
;  (double 10)
;  (halve 4)
; (mul-tree-iter-rel 20 2 5)
;  (double 20)
;  (halve 2)
; (mul-tree-iter-rel 40 1 5)
;  (plus 40 5)
; (mul-tree-iter-rel 40 0 45)
