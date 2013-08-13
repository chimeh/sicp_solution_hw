;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader{lib "htdp-advanced-reader.ss" "lang"}{{modname |1.11|} {read-case-sensitive #t} {teachpacks ()} {htdp-settings #(#t constructor repeating-decimal #t #t none #t ())}}
;#lang racket
;习题1.11
(define (f n) 
   (cond ((< n 3) n) 
        (else (+ (f (- n 1)) 
                 (* 2 (f (- n 2))) 
                 (* 3 (f (- n 3)))))))

(f 6)

;output 59
;tracing
; (f 6)
;  (f 5)
;   (f 4)
;    (f 3)
;     (f 2)
;     (f 1)
;     (f 0)
;    (f 2)
;    (f 1)
;   (f 3)
;    (f 2)
;    (f 1)
;    (f 0)
;   (f 2)
;  (f 4)
;   (f 3)
;    (f 2)
;    (f 1)
;    (f 0)
;   (f 2)
;   (f 1)
;  (f 3)
;   (f 2)
;   (f 1)
;   (f 0)
;