;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader{lib "htdp-advanced-reader.ss" "lang"}{{modname |1.9|} {read-case-sensitive #t} {teachpacks ()} {htdp-settings #(#t constructor repeating-decimal #t #t none #t ())}}
(define (inc y) (+ y 1))
(define (dec y) (- y 1))

;閫掑綊寮
(define (plus a b)
  (if (= a 0)
      b
      (inc (plus (dec a) b))))
;杩唬寮
(define (plus_it a b)
  (if (= a 0)
      b
      (plus_it (dec a) (inc b))))


(plus_it 6 2)




