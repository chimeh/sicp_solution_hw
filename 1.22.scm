#lang planet neil/sicp
(define (square x) (* x x)) 
 
(define (divides? a b) 
  (= (remainder b a) 0)) 
 
(define (find-divisor n test-divisor) 
  (cond ((> (square test-divisor) n) n) 
        ((divides? test-divisor n) test-divisor) 
        (else (find-divisor n (+ test-divisor 1))))) 
 
 (define (smallest-divisor n) 
  (find-divisor n 2)) 
 
 
(define (prime? n) 
  (= n (smallest-divisor n))) 
 
(define (report-prime n elapsed-time) 
  (newline) 
  (display n) 
  (display " *** ") 
  (display elapsed-time))
 
(define (start-prime-test n start-time) 
  (if (prime? n) 
      (report-prime n (- (runtime) start-time)))) 
 
(define (timed-prime-test n) 
  (start-prime-test n (runtime))) 
 
(define (search-for-primes first last) 
  (define (search-iter cur last) 
    (if (<= cur last) (timed-prime-test cur)) 
    (if (<= cur last) (search-iter (+ cur 2) last))) 
  (search-iter (if (even? first) (+ first 1) first) 
               (if (even? last) (- last 1) last))) 
 
(search-for-primes 1000 1019)       ; 1e3 
(search-for-primes 10000 10037)     ; 1e4 
(search-for-primes 100000 100043)   ; 1e5 
(search-for-primes 1000000 1000037) ; 1e6 
 
; As of 2008, computers have become too fast to appreciate the time 
; required to test the primality of such small numbers. 
; To get meaningful results, we should perform the test with numbers 
; greater by, say, a factor 1e6. 
;(newline) 
(search-for-primes 1000000000 1000000021)       ; 1e9 
(search-for-primes 10000000000 10000000061)     ; 1e10 
(search-for-primes 100000000000 100000000057)   ; 1e11 
(search-for-primes 1000000000000 1000000000063) ; 1e12 

 ;the prime output 
 ; 1009 *** 0
 ; 1013 *** 0
 ; 1019 *** 0
 ; 10007 *** 0
 ; 10009 *** 0
 ; 10037 *** 0
 ; 100003 *** 0
 ; 100019 *** 0
 ; 100043 *** 0
 ; 1000003 *** 0
 ; 1000033 *** 0
 ; 1000037 *** 0
 
 ; 1000000007 *** 7000
 ; 1000000009 *** 7000
 ; 1000000021 *** 8000
 ; 10000000019 *** 83000
 ; 10000000033 *** 81000
 ; 10000000061 *** 107000
 ; 100000000003 *** 348000
 ; 100000000019 *** 354000
 ; 100000000057 *** 312000
 ; 1000000000039 *** 1010000
 ; 1000000000061 *** 1147000
 ; 1000000000063 *** 982000
 
 (newline)
 (timed-prime-test 100003)
 (timed-prime-test 100019)
 (timed-prime-test 100043)
 (timed-prime-test 1000003)
 (timed-prime-test 1000033)
 (timed-prime-test 1000037)
 (timed-prime-test 1000000007)
 (timed-prime-test 1000000009)
 (timed-prime-test 1000000021)
 (timed-prime-test 10000000019)
 (timed-prime-test 10000000033)
 (timed-prime-test 10000000061)
 (timed-prime-test 100000000003)
 (timed-prime-test 100000000019)
 (timed-prime-test 100000000057)
 ;the test prime output, do this as the result compare with the 1.23 with 
 ;improve algrithm
 ;100043 *** 1000
 ;1000003 *** 3000
 ;1000033 *** 3000
 ;1000037 *** 3000
 ;1000000007 *** 125000
 ;1000000009 *** 110000
 ;1000000021 *** 108000
 ;10000000019 *** 627000
 ;10000000033 *** 492000
 ;10000000061 *** 474000
 ;100000000003 *** 1609000
 ;100000000019 *** 1437000
 ;100000000057 *** 1414000
  