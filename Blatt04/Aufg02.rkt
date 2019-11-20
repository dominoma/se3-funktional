#lang racket

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
(define buchstaben (string->list "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789,."))

;Liste der Strings des Natoalphabets
(define natobuchstaben
  '("Alfa" "Bravo" "Charlie" "Delta" "Echo" "Foxtrot" "Golf" "Hotel" "India" "Juliett" "Kilo" "Lima" "Mike" "November" "Oscar" "Papa" "Quebec" "Romeo" "Sierra" "Tango" "Uniform" "Victor" "Whiskey" "X-ray" "Yankee" "Zulu" "Nadazero"
 "Unaone"
 "Bissotwo"
 "Terrathree"
 "Kartefour"
 "Pantafive"
 "Soxisix"
 "Setteseven"
 "Oktoeight"
 "Novenine"
 "Decimal"
 "Stop"
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
#|
<schiffsname> ::= ...
<mayday> ::= MAYDAY
<maydayx3> ::= <mayday> <mayday> <mayday>
<hier-ist> ::= HIER IST
<schiffsnamex3> ::= <schiffsname> <schiffsname> <schiffsname>
<nato> ::= ALPHA | BRAVO | ...
<kennung> ::= <nato> <nato> <nato> <nato>
<buchstabieren-start> ::= ICH BUCHSTABIERE
<buchstabiert> ::= <nato> | <buchstabiert> | 
<rufzeichen-start> ::= RUFZEICHEN

<position> ::= ...
<standortangabe> ::= NOTFALLPOSITION <position>
<zeit> ::= ...
<notfallzeit> ::= NOTFALLZEIT <zeit>
<notfallart> ::= ...
<hilfeleistung> ::= (KEINE VERLETZTEN | <zahl> VERLETZTE | <zahl> TOTE) ...
<peilzeichen> ::= ICH SENDE DEN TRÄGER --
<unterschrift> ::= <schiffsname> <kennung> OVER

<notruf> ::= <maydayx3> <hier-ist> <schiffsnamex3>
<kenung> <mayday> <schiffsname> <buchstabieren-start>
<buchstabiert> <rufzeichen-start> <kennung> <standortangabe>
<notfallzeit> <notfallart> <hilfeleistung> <peilzeichen> <unterschrift>
|#
(define <mayday> "MAYDAY")
(define <maydayx3> (string-join `(, <mayday> , <mayday> , <mayday>)))
(define <hier-ist> "HIER IST")
(define <buchstabieren-start> "ICH BUCHSTABIERE")
(define <rufzeichen-start> "RUFZEICHEN")
(define <over> "OVER")

(define (generator schiffsname rufzeichen position notfallzeit notfall angaben)(
                                                            
string-join `(,<maydayx3> ,<hier-ist> ,schiffsname ,schiffsname ,schiffsname 
              ,(buchstabiereTextAlsNato rufzeichen) ,<mayday>, schiffsname, <buchstabieren-start>
              ,(buchstabiereTextAlsNato schiffsname) ,<rufzeichen-start> ,(buchstabiereTextAlsNato rufzeichen)
              ,position ,notfallzeit ,notfall ,angaben ,schiffsname ,(buchstabiereTextAlsNato rufzeichen) ,<over>)
   ))
