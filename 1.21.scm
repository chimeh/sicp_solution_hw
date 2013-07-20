;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader{lib "htdp-advanced-reader.ss" "lang"}{{modname |1.21|} {read-case-sensitive #t} {teachpacks ()} {htdp-settings #(#t constructor repeating-decimal #t #t none #t ())}}
(define (smallest-divisor n)
    (find-divisor n 2))
    
(define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
    ((divides? test-divisor n) test-divisor)
    (else (find-divisor n (+ test-divisor 1)))))
    
(define (divides? a b)
    (= (remainder b a) 0))
    
(define (prime? n)
    (= n (smallest-divisor n)))

(define (square x) (* x x))
;test
(smallest-divisor 199)
(smallest-divisor 1999)
(smallest-divisor 19999)

; 199
; 1999
; 7
 