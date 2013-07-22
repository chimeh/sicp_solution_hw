;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |1.8|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #t ())))
;cube root
;y=guess


(define toleran 0.0000001)

(define (improve x guess) (/ (+ (/ x 
                                   (* guess guess))
                                (* guess 2))
                             3))

(define (good-enough x guess) (< (abs (- guess
                                         (improve x  guess)))
                                 toleran))

(define (cubert-iter x guess) (cond ((good-enough x guess) guess)
                                    (else (cubert-iter x (improve x guess)))))
                               
(define (cubert x) (cubert-iter x 2))

(cubert 27)





















