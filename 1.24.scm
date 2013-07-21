#lang planet neil/sicp
; #lang racket
(define (square n) (* n n))

(define (expmod base exp m)
  (cond ((= exp 0) 1)  
        ((even? exp)
          (remainder (square (expmod base (/ exp 2) m)) m))
        (else
          (remainder (* base (expmod base (- exp 1) m)) m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else #f)))

(define (prime? n)
  (fast-prime? n 100))

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


;test
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
 ;output 由于random 函数范围太小，导致溢出，不能算出所有
 ;100003 *** 5000
 ;100019 *** 4000
 ;100043 *** 5000
 ;1000003 *** 6000
 ;1000033 *** 5000
 ;1000037 *** 5000
 ;1000000007 *** 8000
 ;1000000009 *** 8000
 ;1000000021 *** 8000. . random: contract violation
 ;  expected: (or/c (integer-in 1 4294967087) pseudo-random-generator?)
 ;  given: 10000000018