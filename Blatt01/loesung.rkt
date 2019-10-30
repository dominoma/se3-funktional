#lang racket

(define (degrees->radians degrees)
  (* (/ degrees 360) pi 2))

(define (radians->degrees radians)
  (* (/ radians (* 2 pi)) 360))

(define (my-acos cos-alpha)
  (atan (/ (sqrt (- 1 (* cos-alpha cos-alpha))) cos-alpha)))


(define (nm->km nm)
  (* 1.852 nm))


(define (distanzAB AB AL BB BL)
  (nm->km
   ( * (radians->degrees
        (my-acos (+ (* (sin (degrees->radians AB))
                       (sin (degrees->radians BB)))
                    (* (cos (degrees->radians AB))
                       (cos (degrees->radians BB))
                       (cos (degrees->radians (- AL BL))))))) 60)))




(define (Grad->Himmelsrichtung grad)
                      (case (floor (/ grad 11.25))
                        ((31.0 0.0) 'N)
                        ((1.0 2.0) 'NNE)
                        ((3.0 4.0) 'NE)
                        ((5.0 6.0) 'ENE)
                        ((7.0 8.0) 'E)
                        ((9.0 10.0) 'ESE)
                        ((11.0 12.0) 'SE)
                        ((13.0 14.0) 'SSE)
                        ((15.0 16.0) 'S)
                        ((17.0 18.0) 'SSW)
                        ((19.0 20.0) 'SW)
                        ((21.0 22.0) 'WSW)
                        ((23.0 24.0) 'W)
                        ((25.0 26.0) 'WNW)
                        ((27.0 28.0) 'NW)
                        ((29.0 30.0) 'NNW)
               
  )
)

(define (Himmelsrichtung->Grad Himmelsrichtung)
                      (case Himmelsrichtung
                        ((N) 0.0)
                        ((NNE) 22.5)
                        ((NE) 45.0)
                        ((ENE) 67.5)
                        ((E) 90.0)
                        ((ESE) 112.5)
                        ((SE) 135.0)
                        ((SSE) 157.5)
                        ((S) 180.0)
                        ((SSW) 202.5)
                        ((SW) 225.0)
                        ((WSW) 247.5)
                        ((W) 270.0)
                        ((WNW) 292.5)
                        ((NW) 315.0)
                        ((NNW) 337.5)
               
  )
)