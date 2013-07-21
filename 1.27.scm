#lang racket 
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
  (display ":")
  (display n)  
  (display " *** time(ms):")
  (display elapsed-time)
  (display "----")
  (carm n))

(define (start-prime-test n start-time)
  (cond ((prime? n)(report-prime n (- (current-milliseconds) start-time)))
      (else (display "\n")(display n) (display " can't pass the the fermat test"))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (divides? a b)                                                                ;
  (= (remainder b a) 0))                                                              ;
                                                                                      ;
(define (next n)                                                                      ;
    (if (= n 2)                                                                       ;
        3                                                                             ;
        (+ n 2)))                                                                     ;
                                                                                      ;
(define (find-divisor n test-divisor)                                                 ;
  (cond ((> (square test-divisor) n) n)                                               ;
        ((divides? test-divisor n) test-divisor)                                      ;
        (else (find-divisor n (next test-divisor)))))                                 ;
                                                                                      ;
 (define (smallest-divisor n)                                                         ;
  (find-divisor n 2))                                                                 ;
                                                                                      ;
                                                                                      ;
(define (prime-yes? n)                                                                ;
  (= n (smallest-divisor n)))                                                         ;
                                                                                      ;
(define (carm n)                                                                      ;
  (cond ((prime-yes? n)(display "is prime,pass fermat, not carmichael num"))          ;
        (else (display "is not prime,but can pass fermat test, is Carmichael num")))) ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (timed-prime-test n)
  (start-prime-test n (current-milliseconds)))


;test
 (display "the num pass fermat-test")
 (timed-prime-test 2) 
 (timed-prime-test 13) 
 (timed-prime-test 14)
 (timed-prime-test 561)
 (timed-prime-test 1105)
 (timed-prime-test 1729)
 (timed-prime-test 2821)
 (timed-prime-test 6601)
 (timed-prime-test 100003)
 (timed-prime-test 100019)
 (timed-prime-test 100043)
 
;the output
;Welcome to DrRacket, version 5.3.5 [3m].
;Language: racket; memory limit: 128 MB.
;the num pass fermat-test
;:2 *** time(ms):0----is prime,pass fermat, not carmichael num
;:13 *** time(ms):0----is prime,pass fermat, not carmichael num
;14 can't pass the the fermat test
;:561 *** time(ms):1----is not prime,but can pass fermat test, is Carmichael num
;:1105 *** time(ms):0----is not prime,but can pass fermat test, is Carmichael num
;:1729 *** time(ms):0----is not prime,but can pass fermat test, is Carmichael num
;:2821 *** time(ms):1----is not prime,but can pass fermat test, is Carmichael num
;:6601 *** time(ms):1----is not prime,but can pass fermat test, is Carmichael num
;:100003 *** time(ms):1----is prime,pass fermat, not carmichael num
;:100019 *** time(ms):2----is prime,pass fermat, not carmichael num
;:100043 *** time(ms):2----is prime,pass fermat, not carmichael num
