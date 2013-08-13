;习题1.5
; Note that ``p'' is recursively defined by itself. Therefore, for 
; the applicative-order evaluation, ``p'' will be evaluated in the 
; test, and this will lead to an infinite recursion. While in the 
; normal-order evaluation, the value of p is not evaluated, and 
; thus the test will return 0.
;
;应用序求值：
;先对各个子表达式求值
;将作为最左表达式的值应用到相应的实际参数(其他子表达式的值)
;
;正则序求值：
;先代换在择其求值