#lang racket
(require se3-bib/flaggen-module)

;;;;;;;;;;;Aufg1

;Erstellt eine Map bei der Element n der keys dem Element n der Values zugeordnet ist
(define (createMap keys values)
  (if (empty? values)
      '()
      (cons
       (cons (car keys) (car values))
       (createMap (cdr keys) (cdr values)))
      )    
  )

;Eine Liste der Buchstaben A bis Z + 1 bis 9 und , und . 
(define buchstaben (string->list "ABCDEFGHIJKLMNOPQRSTUVWXYZ123456789,."))

;Liste der Strings des Natoalphabets
(define natobuchstaben
  '("Alfa" "Bravo" "Charlie" "Delta" "Echo" "Foxtrot" "Golf" "Hotel" "India" "Juliett" "Kilo" "Lima" "Mike" "November" "Oscar" "Papa" "Quebec" "Romeo" "Sierra" "Tango" "Uniform" "Victor" "Whiskey" "X-ray" "Yankee" "Zulu"
           )
  )

;Map in der jedem Uppercasebuchstaben A bis Z sein Natoalphabetbeteichner zugerdnet ist
(define char-natoMap
  (createMap buchstaben natobuchstaben)
  )

;Gibt den Natobuchstaben für den uppercasechar zurück
(define (char->Nato uppercasechar)
  (cdr (assoc uppercasechar char-natoMap))
  )
;Wandelt lowercasebuchstaben in uppercase um, alles andere wird unverändert zurückgegeben.
(define (lowercaseChar->uppercaseChar char)
  (let ((i (char->integer char)))
    (if (<= 97 i 122)
        (integer->char (- i 32))
        char
        )
    )
  )

;Buchstabiert einen String in Natoalphabet
(define (buchstabiereTextAlsNato text)
  (string-join
   (charlist->natolist
    (string->list text)))
  )
  
;Liste von chars->Liste von Strings der zugeordneten Natobezeichner
(define (charlist->natolist charlist)
  (if (empty? charlist)
      '()
      (cons
       (char->Nato  (lowercaseChar->uppercaseChar (car charlist)))
       (charlist->natolist (cdr charlist))
       )
      )
  )

;;;;;;;;;;;;;;;;;;Aufg2


;Liste alle Flaggenbuchstaben
(define flaggen '(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z Z0 Z1 Z2 Z3 Z4 Z5 Z6 Z7 Z8 Z9))

(define char-flaggeMap (createMap buchstaben flaggen))

;Gibt für den Buchsaben die Flagge zurück
(define (char->flagge uppercaseChar)
  (eval (cdr (assoc uppercaseChar char-flaggeMap)))
  )

;Buchstabiert einen String in Flaggen
(define (buchstabiereTextAlsFlagge text)
   (charlist->Flaggenlist
    (string->list text))
  )
  
;Liste von chars->Liste vonFlaggen
(define (charlist->Flaggenlist charlist)
  (if (empty? charlist)
      '()
      (cons
       (char->flagge  (lowercaseChar->uppercaseChar (car charlist)))
       (charlist->Flaggenlist (cdr charlist))
       )
      )
  )

  
