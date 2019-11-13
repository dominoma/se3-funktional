#lang racket
(define (createMap keys values)
  (if (empty? values)
      '()
      (cons (cons (car keys) (car values)) (createMap (cdr keys) (cdr values)))
      )
    
  )

(define buchstaben (string->list "ABCDEFGHIJKLMNOPQRSTUVWXYZ123456789,."))

(define natobuchstaben '("Alfa" "Bravo" "Charlie" "Delta" "Echo" "Foxtrot" "Golf" "Hotel" "India" "Juliett" "Kilo" "Lima" "Mike" "November" "Oscar" "Papa" "Quebec" "Romeo" "Sierra" "Tango" "Uniform" "Victor" "Whiskey" "X-ray" "Yankee" "Zulu"

                              ))


(define buchMap (createMap buchstaben natobuchstaben))

(define (char->Nato uppercasechar)
  (cdr (assoc uppercasechar buchMap))
)

(define (lowercaseChar->uppercaseChar char)
  (let ((i (char->integer char)))
    (if (<= 97 i 122)
        (integer->char (- i 32))
        char
        )
    )
  )

(define (buchstabiereTextAlsNato text)
  (string-join
   (charlist->natolist
    (string->list text)))
  )
  

(define (charlist->natolist charlist)
  (if (empty? charlist)
      '()
      (cons
       (char->Nato  (lowercaseChar->uppercaseChar (car charlist)))
       (charlist->natolist (cdr charlist))
       )
      )
  )
  

  
