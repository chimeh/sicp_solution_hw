;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader{lib "htdp-advanced-reader.ss" "lang"}{{modname |1.20|} {read-case-sensitive #t} {teachpacks ()} {htdp-settings #(#t constructor repeating-decimal #t #t none #t ())}}

;习题1.20
(define (gcd-v  a b)
    (if (= b 0)
        a
        (gcd-v b (remainder-user a b))))
        
(define (gcd-user  a b)
    (if (= b 0)
        a
        (gcd-user b (remainder-user a b))))
(define (remainder-user a b) (remainder a b))

;test
(gcd-v 206 40)
(gcd-user 206 40)