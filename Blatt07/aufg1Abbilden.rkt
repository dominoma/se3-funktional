#lang racket

;;Zählt wie oft n in list vorkommt.
(define (zaehlen1 n list)
 (if (null? list)
   0
   (+
    (if (= n (car list))
        1
        0
     )
    (zaehlen1 n (cdr list))
   )
  )
 )

(define (zaehlen2 n list)
  (zahlen2rekHelper n list 0)
  )

(define (zahlen2rekHelper n list offset)
  (if (null? list)
      offset
      (if (= n (car list))
          (zahlen2rekHelper n (cdr list) (+ offset 1))
          (zahlen2rekHelper n (cdr list) offset)
       )
  )
  )

(define (zaehlen3 n list)
  (length (filter (curry = 1) list))
  )