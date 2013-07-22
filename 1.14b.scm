;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname 1.14b) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
﻿; Copyright (C) 2010 Toby Thain, toby@telegraphics.com.au

; SICP, 1.2.2 Tree Recursion
; Counting change example.

; To run: 'make tree' in the CLI.
; produces, via graphviz, a diagram of the "recursion tree" in tree.svg

#lang planet neil/sicp

(define (count-change amount coins parent-id branch)
  (define (pr lst) (for-each display lst))
  (define (graph-edge t p edge-label)
    (pr (list t " -> " p))
    (if edge-label (pr (list " [label=\"  " edge-label "\"]")))
    (display #\;)
    (newline))
  (define (value-node t c n)
    (pr (list t " [label=" n ",fillcolor=" c "];"))
    (newline)
    n)
  (define (combine-node t amount coins n)
    (pr (list t " [label=\"" amount #\space coins "\",shape=box];"))
    (newline)
    n)

  (let ((id (if branch (+ (* parent-id 2) branch) parent-id)))
    (if (> id 1)
      (graph-edge id parent-id (if (= branch 1) (car coins) #f)))
    (cond ((= amount 0)  (value-node id 1 1))  ; one solution! coins chosen equal to amount
          ((< amount 0)  (value-node id 2 0))  ; no solution, last coin was larger than amount
          ((null? coins) (value-node id 4 0))  ; no more solutions, used all coin types
          (else (combine-node id amount coins
                  (+  ; count ways of making change without this coin:
                    (count-change amount (cdr coins) id 0)
                      ; use this coin. count ways for remaining amount:
                    (count-change (- amount (car coins)) coins id 1)))))))

(display "digraph recursion_tree {")
(newline)

(count-change 11 '(50 25 10 5 1) 1 #f)

(display "}")
(newline)