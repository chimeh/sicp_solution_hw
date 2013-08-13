;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader{lib "htdp-advanced-reader.ss" "lang"}{{modname |1.16|} {read-case-sensitive #t} {teachpacks ()} {htdp-settings #(#t quasiquote mixed-fraction #t #t none #t ())}}

;习题1.16
(define (fast-expt-v2 b n) (fast-expt-iter b n 1))

(define (fast-expt-iter b counter product)
  (cond ((= counter 0) product)
         ((even? counter) (fast-expt-iter (square b) (/ counter 2) product))
         (else (fast-expt-iter b (- counter 1) (* b product)))))


(define (enven? n) (remainder n 0))
(define (square n) (* n n))

;test
(fast-expt-v2 2 21)


;the tracing

 ; (fast-expt-v2 2 21)
 ; (fast-expt-iter 2 21 1)
 ; (fast-expt-iter 2 20 2)
 ; (square 2)
 ; (fast-expt-iter 4 10 2)
 ; (square 4)
 ; (fast-expt-iter 16 5 2)
 ; (fast-expt-iter 16 4 32)
 ; (square 16)
 ; (fast-expt-iter 256 2 32)
 ; (square 256)
 ; (fast-expt-iter 65536 1 32)
 ; (fast-expt-iter 65536 0 2097152)