#lang racket
(require se3-bib/setkarten-module)

(define form '(oval rectangle wave))
(define farbe '(red blue green))
(define anzahl '(1 2 3))
(define fuellung '(outline hatched solid))

(define cards (cartesian-product anzahl form fuellung farbe))

(define (show-cards cards)
  (map (lambda (card-data) (apply show-set-card card-data)) cards)
  )

(define (is-a-set? k1 k2 k3)
  (not (member #f (map
                   (lambda (c1 c2 c3)
                     (or (and (equal? c1 c2) (equal? c1 c3) (equal? c2 c3))
                         (not (or (equal? c1 c2) (equal? c1 c3) (equal? c2 c3)))
                         )

       
                     ) k1 k2 k3))))