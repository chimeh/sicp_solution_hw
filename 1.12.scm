
(define (pascal-triangle row col) 
  (cond ((> col row) 0) 
        ((< col 0) 0) 
        ((= col 1) 1) 
        ((+ (pascal-triangle (- row 1) (- col 1)) 
            (pascal-triangle (- row 1) col))))) 
 
;; Testing 
(pascal-triangle 1 1) 
(pascal-triangle 2 2) 
(pascal-triangle 3 2) 
(pascal-triangle 4 2) 
(pascal-triangle 5 2) 
(pascal-triangle 5 3)
