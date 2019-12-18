#lang racket
(require 2htdp/image)
(require 2htdp/universe)

;;Spielfeld ist Vektor mit 30 * 30 felder
(define (spielfeld) (make-vector 900 #f))

;;Adressierung per x y eines feldes das ein Spielfeld ist
(define (getCoord feld x y)
  (if (and (>= 29 x 0) (>= 29 y 0))
      (vector-ref feld (+ (* x 30) y))
      #f
      )
  )

;;Verändern eines Feldes addressiert per x y eines Spielfeld ist
(define (setCoord feld x y value)
  (vector-set! feld (+ (* x 30) y) value)
  )

;;Gibt eine Liste der Werte zurück, die die koordinate x y auf dem feld umgeben
(define (getUmgebung feld x y)
  (list
   (getCoord feld (sub1 x) (sub1 y)) (getCoord feld x (sub1 y)) (getCoord feld (add1 x) (sub1 y))
   (getCoord feld (sub1 x)  y)                              (getCoord feld (add1 x)  y)
   (getCoord feld (sub1 x) (add1 y)) (getCoord feld x (add1 y)) (getCoord feld (add1 x) (add1 y))
   )
  )

;;gibt den Folgezustand der koordinate x y auf dem feld zurück
(define (getZustand feld x y)
  (let ((nachbarn# (length (filter identity (getUmgebung feld x y)))))
    (or (and (getCoord feld x y) (<= 2 nachbarn# 3)) (= nachbarn# 3))
    )
  )

;;Gibt eine geupdatete Version des Spielfelds feld zurück
(define (updateSpielfeld! feld)
  (let ((tempFeld (spielfeld)))
    ((lambda x tempFeld) (map (curry updateLine! feld tempFeld) (build-list 30 (lambda x (car x)))))
    )
  )

;;Schreibt in linie y des newfelds die folgezustände des oldfelds in linie y
(define (updateLine! oldfeld newfeld y)
  (map (curry updateField! oldfeld newfeld y) (build-list 30 (lambda x (car x))))
  )

;;Schreibt an koordinate x y des newfelds den folgezustand von x y von oldfeld
(define (updateField! oldfeld newfeld x y)
  (setCoord newfeld x y (getZustand oldfeld x y))
  )

;;Gibt ein Startfeld zurück
(define (startfeld)
  (let ((feldInConstruct (spielfeld)))
    ((lambda x feldInConstruct)(setStartzustände feldInConstruct 0 gleiter))
    )
  )

(define gleiter (list (cons 2 0) (cons 2 1) (cons 2 2) (cons 1 2) (cons 0 1) ))

;; feld: Ein Feld das verändert werden soll; trues: Liste von koordinatenpaaren die true gesetzt werden sollen
;;Hilfsfunktion zum erstellen eines Startfelds. Rekursiver Aufruf, bullshit ist hack um das setten mit dem rekursionsaufruf zu verbinden
(define (setStartzustände feld bullshit trues)
  (if (null? trues)
      #t
      (setStartzustände
       feld
       (setCoord feld (cdar trues) (caar trues) #t)
       (cdr trues))
      )
  )

;;;;;;;;;;;;;;;;;;;;;;;;Animation

( define (cell state)
   (if state
       (square 10 "solid" "black")
       (square 10 "outline" "black")
       )
   )

(define (build_map_x feld x y)
  (if (< x 30)
      (beside/align "top"
                    (cell (getCoord feld x y))
                    (build_map_x feld (+ x 1) y)
                    )
      (square 0 "outline" "black")
      )
  )
(define (build_map_y feld x y)
  (if (< y 30)
      (above/align "left"
                   (build_map_x feld 0 y)
                   (build_map_y feld x (+ y 1))
                   )
      (square 0 "outline" "black")
      )
  )


(define (build_map feld x y)
  (build_map_y feld x y)
  )

(define (draw_map feld)
  (build_map_y feld 0 0)
  )

(define (anim startwelt)
  (big-bang
      startwelt
    (on-tick updateSpielfeld! 0.25)
    (to-draw draw_map)
    )
  )
      

