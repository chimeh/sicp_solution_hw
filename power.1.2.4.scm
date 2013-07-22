;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader{lib "htdp-advanced-reader.ss" "lang"}{{modname power.1.2.4} {read-case-sensitive #t} {teachpacks ()} {htdp-settings #(#t quasiquote mixed-fraction #t #t none #t ())}}
;#lang planet neil/sicp

;normal version
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (expt-iter b counter product)
    (if (= counter 0)
         product
         (expt-iter b
                    (- counter 1)
                    (* b product))))
                    
(define (expt_my b n)
    (expt-iter b n 1))

;fast version
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (squre (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (enven? n) (remainder n 0))
(define (squre n) (* n n))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;test
(display "fast version:\n")
(fast-expt 2 21)

(display "normal version:\n" )
(expt_my 2 21)


;the tracing

; (fast-expt 2 21)
 ; (fast-expt 2 20)
  ; (fast-expt 2 10)
   ; (fast-expt 2 5)
    ; (fast-expt 2 4)
     ; (fast-expt 2 2)
      ; (fast-expt 2 1)
       ; (fast-expt 2 0)
     ; (squre 2)
    ; (squre 4)
  ; (squre 32)
 ; (squre 1024)
 
 ;the normal version
 
; (expt_my 2 21)
; (expt-iter 2 21 1)
; (expt-iter 2 20 2)
; (expt-iter 2 19 4)
; (expt-iter 2 18 8)
; (expt-iter 2 17 16)
; (expt-iter 2 16 32)
; (expt-iter 2 15 64)
; (expt-iter 2 14 128)
; (expt-iter 2 13 256)
; (expt-iter 2 12 512)
; (expt-iter 2 11 1024)
; (expt-iter 2 10 2048)
; (expt-iter 2 9 4096)
; (expt-iter 2 8 8192)
; (expt-iter 2 7 16384)
; (expt-iter 2 6 32768)
; (expt-iter 2 5 65536)
; (expt-iter 2 4 131072)
; (expt-iter 2 3 262144)
; (expt-iter 2 2 524288)
; (expt-iter 2 1 1048576)
; (expt-iter 2 0 2097152)