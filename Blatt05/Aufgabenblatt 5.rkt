#lang racket
(require se3-bib/butterfly-module)

#|schmetterling: '(dominant '(farbe musterung fühlerform flügelform)
                   rezessiv '(farbe musterung fühlerform flügelform))|#
(define dominanz-musterung '(star dots stripes))
(define dominanz-farbe '(red green blue yellow))
(define dominanz-fuehler '( curved straight curly))
(define dominanz-fluegel '(ellipse hexagon rhomb ))

(define (dominanz regeln gen1 gen2)
  (if (< (index-of regeln gen1) (index-of regeln gen2))
      (cons gen1 gen2)
      (cons gen2 gen1)
      )
  )
(define (pair-struct schmett)
  (map cons (car schmett) (cdr schmett))
  )
#| |#
(define (listofgenpairs->pairofgenlist listofgenpairs)
  (cons (map car listofgenpairs) (list (map cdr listofgenpairs)))
  )
                                                       

(define (rand-gen 2-gene)
  (if (< (random) 0.5)
      (car 2-gene)
      (cdr 2-gene)
      )
  )
(define (liebe-machen mutter vater)
  [let ((kindUnordered (cons (map rand-gen mutter)
  (map rand-gen vater))))
    (list (dominanz dominanz-farbe (caar kindUnordered) (cadr kindUnordered))
   (dominanz dominanz-musterung (cadar kindUnordered) (caddr kindUnordered))
   (dominanz dominanz-fuehler (caddar kindUnordered) (cadddr kindUnordered))
 (dominanz dominanz-fluegel (cadr (cddar kindUnordered)) (cadr(cdddr kindUnordered))))
   ]
 )

#|(liebe-machen '((red . yellow) (star . dots) (straight  . curly) (hexagon  . rhomb )) '((blue . green) (stripes . star) (curved . straight) (ellipse . hexagon )))|#

(define (malSchmetterling schmetterling)
(let ((sichtbar (car (listofgenpairs->pairofgenlist schmetterling))))
  (show-butterfly (car sichtbar) (cadr sichtbar) (caddr sichtbar) (cadddr sichtbar))
))
#|'((red . yellow) (star . dots) (straight  . curly) (hexagon  . rhomb ))|#