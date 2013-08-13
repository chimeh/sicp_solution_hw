;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader{lib "htdp-advanced-reader.ss" "lang"}{{modname |1.12|} {read-case-sensitive #t} {teachpacks ()} {htdp-settings #(#t constructor repeating-decimal #t #t none #t ())}}
;#lang racket
;习题1.12
;帕斯卡三角
(define (pascal-triangle row col) 
  (cond ((> col row) 0) 
        ((< col 0) 0) 
        ((= col 1) 1) 
        (else (+ (pascal-triangle (- row 1) (- col 1)) 
              (pascal-triangle (- row 1) col))))) 
 
;; Testing 
;(pascal-triangle 1 1) 
;(pascal-triangle 2 2) 
;(pascal-triangle 3 2) 
;(pascal-triangle 4 2) 
;(pascal-triangle 5 2) 
(pascal-triangle 5 3)

;output 6 tracing (pascal-triangle 5 3)
; (pascal-triangle 5 3)
;  (pascal-triangle 4 2)
;   (pascal-triangle 3 1)
;   (pascal-triangle 3 2)
;    (pascal-triangle 2 1)
;    (pascal-triangle 2 2)
;     (pascal-triangle 1 1)
;     (pascal-triangle 1 2)
;  (pascal-triangle 4 3)
;   (pascal-triangle 3 2)
;    (pascal-triangle 2 1)
;    (pascal-triangle 2 2)
;     (pascal-triangle 1 1)
;     (pascal-triangle 1 2)
;   (pascal-triangle 3 3)
;    (pascal-triangle 2 2)
;     (pascal-triangle 1 1)
;     (pascal-triangle 1 2)
;    (pascal-triangle 2 3)
;