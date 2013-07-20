;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader{lib "htdp-advanced-reader.ss" "lang"}{{modname |1.19|} {read-case-sensitive #t} {teachpacks ()} {htdp-settings #(#t constructor repeating-decimal #t #t none #t ())}}

;如何使用线型代数的知识，来直观的简化这道题？？
;算子是线型的？？怎么看出来？怎么判断？有什么性质？？
(define (fib n)
    (fib-iter 1 0 0 1 n))
(define (fib-iter a b p q count)
    (cond ((= count 0) b)
          ((even? count)
           (fib-iter a
                     b
                     (+ (* q q) (* p p));compute q'
                     (+ (* p q) (* q q) (* p q));compute p'
                     (/ count 2)))
           (else (fib-iter (+ (* b q) (* a q) (* a p))
                           (+ (* b p) (* a q))
                           p
                           q
                           (- count 1)))))
                           
;linear iteration
(define (fib-lin n) (fib-iter-lin 1 0 n))
(define (fib-iter-lin a b count)
    (if (= count 0)
        b
        (fib-iter-lin (+ a b) a (- count 1))))
        
;test
(fib-lin 9)
(fib 9)
        