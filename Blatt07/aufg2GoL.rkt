#lang racket

(define spielfeld (make-vector 30 (make-vector 30 #f)))

(define (getCoord x y)
  (vector-ref (vector-ref spielfeld x) y)
  )

(define (setCoord x y value)
  (vector-set! (vector-ref spielfeld x) y value)
  )