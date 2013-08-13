;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader{lib "htdp-advanced-reader.ss" "lang"}{{modname |1.9|} {read-case-sensitive #t} {teachpacks ()} {htdp-settings #(#t constructor repeating-decimal #t #t none #t ())}}
;#lang racket
;习题1.9
(define (inc y) (+ y 1))
(define (dec y) (- y 1))

;递归
(define (plus a b)
  (if (= a 0)
      b
      (inc (plus (dec a) b))))
;迭代
(define (plus_it a b)
  (if (= a 0)
      b
      (plus_it (dec a) (inc b))))

(plus 6 2)
(newline)
(plus_it 6 2)

;测试结果
; (plus 6 2)
;  (dec 6)
;  (plus 5 2)
;   (dec 5)
;   (plus 4 2)
;    (dec 4)
;    (plus 3 2)
;     (dec 3)
;     (plus 2 2)
;      (dec 2)
;      (plus 1 2)
;       (dec 1)
;       (plus 0 2)
;      (inc 2)
;     (inc 3)
;    (inc 4)
;   (inc 5)
;  (inc 6)
; (inc 7)
; (plus_it 6 2)
;  (dec 6)
;  (inc 2)
; (plus_it 5 3)
;  (dec 5)
;  (inc 3)
; (plus_it 4 4)
;  (dec 4)
;  (inc 4)
; (plus_it 3 5)
;  (dec 3)
;  (inc 5)
; (plus_it 2 6)
;  (dec 2)
;  (inc 6)
; (plus_it 1 7)
;  (dec 1)
;  (inc 7)
; (plus_it 0 8)
;


