#lang planet neil/sicp
(define (square x) (* x x)) 
 
(define (divides? a b) 
  (= (remainder b a) 0)) 
 
(define (next n)
    (if (= n 2)
        3
        (+ n 2)))
 
(define (find-divisor n test-divisor) 
  (cond ((> (square test-divisor) n) n) 
        ((divides? test-divisor n) test-divisor) 
        (else (find-divisor n (next test-divisor))))) 
 
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
 ;the output                      the 1.22 result
 ;100043 *** 0                    ;100043 *** 1000
 ;1000003 *** 2000                ;1000003 *** 3000
 ;1000033 *** 2000                ;1000033 *** 3000
 ;1000037 *** 2000                ;1000037 *** 3000
 ;1000000007 *** 61000            ;1000000007 *** 125000
 ;1000000009 *** 55000            ;1000000009 *** 110000
 ;1000000021 *** 75000            ;1000000021 *** 108000
 ;10000000019 *** 297000          ;10000000019 *** 627000
 ;10000000033 *** 287000          ;10000000033 *** 492000
 ;10000000061 *** 289000          ;10000000061 *** 474000
 ;100000000003 *** 842000         ;100000000003 *** 1609000
 ;100000000019 *** 790000         ;100000000019 *** 1437000
 ;100000000057 *** 866000         ;100000000057 *** 1414000
 
 ;分析可知，1.23的算法速度与1.22的算法速度接近2，但小于2.
 ;原因是：
  