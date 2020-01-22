#lang racket

;;Speilfeld aus der Aufgabe
( define spiel
   #(0      0      0      0      0      9      0      7      0      0      0      0      0      8      2      0      5      0      3      2      7      0      0      0      0      4     0     0     1     6     0     4     0     0     0     0     0     5     0     0     0     0     3     0     0     0     0     0     0     9     0     7     0     0     0     0     0     6     0     0     0     0     5     8     0     2     0     0     0     0     0     0     0     0     4     2     0     0     0     0     8))
;;;;;;Aufg 1.1
;;Speilfeldindex für Spalte x und Zeile y
(define (xy->index x y)
  (+ (* y 9) x)
  )

;;Alle Indizes der Felder in Zeile y
(define (zeile->indizes y)
  (range (* y 9)(+ (* y 9) 9))
  )

;;Alle Indizes der Felder in Spalte x
(define (spalte->indizes x)
  (range x 81 9)
  )

;;Hilfsfunktion gibt zurück Liste von input, input + offset, input + 2*offset
(define (generateListPlusOffset input offset)
  (map (curry + input) (list 0 offset (* 2 offset) ))
  )

;;Alle Indizes im Quadranten z
(define (quadrant->indizes z)
  (let* (
         (spalte (* (modulo z 3)3))
         (zeile (* (quotient z 3) 3))
         (startwert (xy->index spalte zeile)))
    (apply append (map (curryr generateListPlusOffset 1) (generateListPlusOffset startwert 9)))
    )
  )

;;Gibt alle Einträge der Indexe zurück, beides Listen
(define (spiel->eintraege spiel indexes)
  (map (curry vector-ref spiel) indexes)
  )

;;ISt das übergebene Spiel konsistent?
(define (spiel-konsistent? spiel)
  (empty?
   (filter check-duplicates (map
                             (curry remove* '(0))
                             (map (curry spiel->eintraege spiel)
                                  (append
                                   (map quadrant->indizes (range 9))
                                   (map spalte->indizes (range 9))
                                   (map zeile->indizes (range 9)))))))
  )

;;Ist das übergebene Spiel gelöst?
(define (spiel-geloest? spiel)
  (and (spiel-konsistent? spiel)
       (not (vector-member 0 spiel))
       )
  )


;;Aufg 1.2
(define (markiere-ausschlussMitCopy spiel zahl)
  (map (curryr (curry markiere-ausschlussFeld spiel) zahl) (range 81))
  )

(define (markiere-ausschluss spiel  zahl)
  (let* ((vecCopy (vector-copy spiel))
         (trash (markiere-ausschlussMitCopy vecCopy zahl)))
    vecCopy
    )
  )

(define (markiere-ausschlussFeld spiel index zahl)
  (if (equal? (vector-ref spiel index) 0)
      (if (feldBlockiert? spiel index zahl)
          (vector-set! spiel index 'X)
          spiel)
      spiel
      )
  )

(define (feldBlockiert? spiel index zahl)
  (member zahl
          (apply append
                 (map (curry spiel->eintraege spiel)
                      (list (quadrant->indizes (index->quadrant index))
                            (spalte->indizes (modulo index 9))
                            (zeile->indizes (quotient index 9)))
                      )))
  )

(define (index->quadrant index)
  (let  ((spalte (modulo index 9))
         (zeile (quotient index 9)))
    (+(*(quotient zeile 3) 3) (quotient spalte 3))
    )
  )

;;Indexe in denen die Zahl gesetzt werden kann
(define (eindeutige-positions spiel zahl)
  (let ((xedSpielfeld (markiere-ausschluss spiel zahl)))
    (filter (curry eindeutigesFeld xedSpielfeld)  (range 81))
    )
  )
 
(define (eindeutigesFeld spiel index)
 (and
   (eq? 0 (vector-ref spiel index))
  (or
   (1nullInIndizes spiel (zeile->indizes (quotient index 9)))
   (1nullInIndizes spiel (spalte->indizes (modulo index 9)))
   (1nullInIndizes spiel (quadrant->indizes(index->quadrant index)))))
  )

;;Ob an den übergebenen indexen insgesamt genau eine 0 ist
(define (1nullInIndizes xedSpiel indexe)
  (= 1 (length(filter (curry eq? 0 )(spiel->eintraege xedSpiel indexe))))
  )

(define (loeseSpiel spiel)
  (let ((nextStep (loeseSpielStep spiel)))
    (if(equal? spiel nextStep)
       nextStep
       (loeseSpiel nextStep)
       ))
 )

(define (loeseSpielStep spiel)
(let* (
       (vecCopy (vector-copy spiel))
       (trash (map
   (lambda (pair) (vector-set! vecCopy (cdr pair) (car pair)))
   (apply append
          (map (curry ZahlKandidatenPaar spiel) (range 1 10))))  ))
    vecCopy
    )
  )

(define (ZahlKandidatenPaar spiel zahl)
  (map (curry cons zahl)  (eindeutige-positions spiel zahl))
  )

;;Aufg 1.3
(require 2htdp/image)

( define (cell spiel x y)
    (let ((wert (vector-ref spiel (xy->index x y))))
      (if(= wert 0 )
       (square 20 "outline" "black")
       (overlay (square 20 "outline" "black")
                (text (number->string wert) 15 "black")
       )
      )
   )
   )
   

(define (build_map_x spiel x y)
  (if (< x 9)
      (beside/align "top"
                    (cell spiel x y)
                    (build_map_x spiel (+ x 1) y)
                    )
      (square 0 "outline" "black")
      )
  )
(define (build_map_y spiel x y)
  (if (< y 9)
      (above/align "left"
                   (build_map_x spiel 0 y)
                   (build_map_y spiel x (+ y 1))
                   )
      (square 0 "outline" "black")
      )
  )


(define (build_map spiel x y)
  (build_map_y spiel x y)
  )

(define (draw_map spiel)
  (build_map_y spiel 0 0)
  )
