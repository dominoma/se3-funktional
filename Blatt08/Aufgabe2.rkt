#lang racket

(define (listeQuadrierungen liste)
  (map sqr liste)
  )

(define (durch3oder7 liste)
  (filter
   (lambda (x) (or (= 0 (modulo x 3))(= 0 (modulo x 7))))
   liste)
  )

(define (summe>6 xs)
  (foldl + 0 (filter (lambda (x) (and ()))))
  )