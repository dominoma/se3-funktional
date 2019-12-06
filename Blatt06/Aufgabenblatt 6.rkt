#lang racket
(require 2htdp/image)
( define baum1 (above/align
"center"
; ; der Stern an der Spitze
( star-polygon 40 5 2 "solid" "gold" )
; ; die Zweige
( triangle 50 "solid" "darkgreen" )
( triangle 90 "solid" "darkolivegreen" )
( triangle 120 "solid" "olivedrab" )
( triangle 150 "solid" "darkgreen" )
; ; der Stamm
( rectangle 40 60 "solid" "brown" )
))
#|Hilfsfunktion für das erstellen eines ungeschmückten baumes|#
(define (build_baum_raw_h side_len)
  (if (< side_len 50)
      ( star-polygon 40 5 2 "solid" "gold" )
      (overlay/align/offset
          "center" "bottom"
          ( triangle side_len "solid" "darkgreen" )
          0 (- 5 (* side_len 0.7))
          (build_baum_raw_h (- side_len 40))
          )
  )
)
#|Erstellt einen ungeschmückten baum|#
(define (build_baum_raw side_len)
  (above/align
   "center"
   (build_baum_raw_h side_len)
   ( rectangle 40 60 "solid" "brown" )
  )
)
#|Erstellt ein Geschenk mit breite w und höhe h in der Farbe color_p mit geschenkband der farbe color_s|#
(define (geschenk w h color_p color_s)
  (overlay/align/offset
   "center" "center"
   (overlay/align/offset
    "center" "center"
    ( rect_outline w (/ h 5) color_s)
    0 0
    ( rect_outline (/ h 5) h color_s)
    )
   
   0 0
   ( rect_outline w h color_p)
   )
  )

#|Hilfsfunktion für ein Dreieck mit schwarzen outlines|#
(define (tri_outline w color_r)
  (overlay/align/offset
  "center" "bottom"
   (triangle w "outline" "black")
   0 0
   (triangle w "solid" color_r)
))

#|Hilfsfunktion für ein Rectangle mit schwarzen Outlines|#
(define (rect_outline w h color_h)
  (overlay/align/offset
  "center" "bottom"
   (rectangle w h "outline" "black")
   0 0
   (rectangle w h "solid" color_h)
))


#|Zeichnet ein Haus bestehendend aus einem Hauptteil (Rectangle) Ein Dreieck als Dach und eine Tür im Haus|#
(define (haus w h color_h color_r color_d)
  (overlay/align/offset
  "center" "bottom"
  (rect_outline (/ w 3.5) (/ h 2.5) color_d)
  0 0
  (above/align
     "center"
    (tri_outline w color_r)
    (rect_outline w h color_h)
   )
  )
)
#|Funktion die uns 3 Geschenke nebeneinander baut|#
(define geschenk_multiple
  (beside/align "bottom"
  (geschenk 60 40 "blue" "red")
  (geschenk 80 60 "red" "gold")
  (geschenk 100 80 "green" "silver")
  )
)
#|Alles zusammen nebeneinander|#
(define weihnachten
  (beside/align "bottom" (haus 120 50 "green" "red" "brown")  (build_baum_raw 90) geschenk_multiple)
  )


