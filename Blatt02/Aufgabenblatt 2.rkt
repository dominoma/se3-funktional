#lang racket
( define wuff 'Flocki)
( define Hund wuff )
( define Wolf 'wuff )
( define ( welcherNameGiltWo PersonA PersonB )
   ( let ( ( PersonA 'Zaphod )
           ( PersonC PersonA ) )
      PersonC ) )
( define xs1 '( 0 2 3 wuff Hund ) )
( define xs3 ( list wuff Hund ) )
( define xs2 ( cons Hund wuff ) )
#|
1. 'Flocki
2. 'Flocki
3. 'wuff
4. 'Hund
5. 'Flocki
6. Flocki undefined
7. 'wuff
8. 'lily
9. '(wuff Hund)
10. 'Flocki
11. '(Flocki)
12. 1/2
13. 'Wolf
14. 'wuff
|#

(define (fak n)
  (if (eqv? n 0) 1
      (* n (fak (- n 1))))
  )

(define (power r n)
  (if (eqv? n 0) 1
      (if (even? n) (sqr (power r (/ n 2)))
          (* r (power r (- n 1)))))
  )

(define (euRec f n)
  (let* ((nf (* f n)) (b (/ 1 nf)))
    (if (< b 1E-100) b
        (+ b (euRec nf (+ n 1))))
    ))

(define (euler)( * (+ 1 (euRec 1 1)) 1E100))

(define (type-of input)
  (cond 
         ((boolean? input) boolean?)
         ((list? input) list?)
         ((pair? input) pair?)
         ((symbol? input) symbol?)
         ((number? input) number?)
         ((char? input) char?)
         ((string? input) string?)
         ((vector? input) vector?)
         ((procedure? input) procedure?)
        
         ))