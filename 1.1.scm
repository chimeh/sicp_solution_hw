;习题1.1
10  ;10
(+ 5 3 4)            ; 12
(- 9 1)              ; 8
(/ 6 2)              ; 3
(+ (* 2 4) (- 4 6))  ;6
(define a 3)          ;undef but effect a =3
(define b (+ a 1))    ; undef b = a+1=4
(+a b (* a b))        ;a+b+ab=19
(= a b)               ; #f

(if (and (> b a) (< a(* a b)))
b
a)                     ;4

(cond ((= a 4) 6)
((= b 4) (+ 6 7 a))    ;16
(else 25))

(+ 2 (if (> b a) b a)   ;6

(* (cond ((> a b) a)
         ((< a b) b)
         (else -1))
   (+ a 1))             ;16
