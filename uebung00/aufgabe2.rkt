#lang racket
(define (zins k z j)
  (* k (expt (+ 1 z) j)))
(define g 9.81)
(define (fallzeit s)
  (sqrt (/ (* 2 s) g)))
(define (gesw s)
  (* g (fallzeit s)))
(define (energie m s)
  ( * 0.5 m (expt (gesw s) 2)))