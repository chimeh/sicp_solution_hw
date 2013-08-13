;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader{lib "htdp-advanced-reader.ss" "lang"}{{modname |1.17|} {read-case-sensitive #t} {teachpacks ()} {htdp-settings #(#t quasiquote repeating-decimal #t #t none #t ())}}

;习题1.17
;low vesion mul, linear step alone with the problem scale b
;linear recursion
(define (mul-lin-rec a b)
    (if (= b 1)
        a
        (plus a (mul-lin-rec a (- b 1)))))
        
;linear iteration
(define (mul-lin-iter a  b)
    (mul-lin-iter-rel a b 0))
    
(define (mul-lin-iter-rel a counter reslt)
    (if (= counter 0)
        reslt
        (mul-lin-iter-rel a (- counter 1) (plus reslt a))))
        
;fast version mul, use tree recursion
(define (mul-tree-rec a b)
    (if ( = b 1)
        a
        (if (even? b)
            (double (mul-tree-rec a (halve b)))
            (plus a (mul-tree-rec a (- b 1))))))
            
;fast version mul, use tree iteration 
(define (mul-tree-iter a b)
    (mul-tree-iter-rel a b 0))
    
(define (mul-tree-iter-rel a counter reslt)
     (if (= counter 0)
         reslt
         (if (even? counter)
             (mul-tree-iter-rel (double a) (halve counter)  reslt )
             (mul-tree-iter-rel a (- counter 1) (plus a reslt)))))

(define (double x) (* x 2))
(define (halve x) (/ x 2))
(define (plus x y) (+ x y))
;test
(mul-lin-rec 3 8)
(mul-lin-iter 3 8)
(mul-tree-rec 3 8)
(mul-tree-iter 3 8)


;
; (mul-lin-rec 3 8)
;  (mul-lin-rec 3 7)
;   (mul-lin-rec 3 6)
;    (mul-lin-rec 3 5)
;     (mul-lin-rec 3 4)
;      (mul-lin-rec 3 3)
;       (mul-lin-rec 3 2)
;        (mul-lin-rec 3 1)
;       (plus 3 3)
;      (plus 3 6)
;     (plus 3 9)
;    (plus 3 12)
;   (plus 3 15)
;  (plus 3 18)
; (plus 3 21)
; (mul-lin-iter 3 8)
; (mul-lin-iter-rel 3 8 0)
;  (plus 0 3)
; (mul-lin-iter-rel 3 7 3)
;  (plus 3 3)
; (mul-lin-iter-rel 3 6 6)
;  (plus 6 3)
; (mul-lin-iter-rel 3 5 9)
;  (plus 9 3)
; (mul-lin-iter-rel 3 4 12)
;  (plus 12 3)
; (mul-lin-iter-rel 3 3 15)
;  (plus 15 3)
; (mul-lin-iter-rel 3 2 18)
;  (plus 18 3)
; (mul-lin-iter-rel 3 1 21)
;  (plus 21 3)
; (mul-lin-iter-rel 3 0 24)
; (mul-tree-rec 3 8)
;  (halve 8)
;  (mul-tree-rec 3 4)
;   (halve 4)
;   (mul-tree-rec 3 2)
;    (halve 2)
;    (mul-tree-rec 3 1)
;   (double 3)
;  (double 6)
; (double 12)
; (mul-tree-iter 3 8)
; (mul-tree-iter-rel 3 8 0)
;  (double 3)
;  (halve 8)
; (mul-tree-iter-rel 6 4 0)
;  (double 6)
;  (halve 4)
; (mul-tree-iter-rel 12 2 0)
;  (double 12)
;  (halve 2)
; (mul-tree-iter-rel 24 1 0)
;  (plus 24 0)
; (mul-tree-iter-rel 24 0 24)
;
;
