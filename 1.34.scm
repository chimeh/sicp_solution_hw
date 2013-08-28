#lang racket

(define (f g) (g 2))
(f f)
;function call: expected a function after the open parenthesis, but received 2
; procedure application: expected procedure, given: 2 arguments were: 2
;(2 2) 非法