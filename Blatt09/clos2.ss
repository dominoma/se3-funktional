#lang swindle
(require swindle/setf
swindle/misc
racket/string)

(defclass Video ()
(schluessel
 :initarg :schluessel
 :accessor schluessel)
(ersteller
 :initarg :ersteller
 :accessor ersteller)
(jahr
 :initarg :jahr
 :accessor jahr)
(titel
 :initarg :titel
 :accessor titel))


(defclass Film (Video)
(produktion
 :initarg :produktion
 :accessor produktion)
 (regisseur
 :initarg :regisseur
 :accessor regisseur)
(genre
 :initarg :genre
 :accessor genre)
(altersfreigabe
 :initarg :altersfreigabe
 :accessor altersfreigabe))

(defclass Serie (Film)
(plattform
 :initarg :plattform
 :accessor plattform)
 (nummerfolge
 :initarg :nummerfolge
 :accessor nummerfolge))


(defclass YTVideo(Video)
(kanal
 :initarg :kanal
 :accessor kanal)
 (videolink
 :initarg :videolink
 :accessor videolink)
(monat
 :initarg :monat
 :accessor monat))

;;TODO schluessel?
(define (makeMulan)
   (make Film :ersteller 'Chris_Bender :jahr '2020 :titel 'Mulan :produktion 'Walt_Disney_Pictures :genre 'abenteuer :altersfreigabe 'PG-13)
  )

;;TODO alle Angaben einfügen
(define (makeGroßePause)
  (make Serie :ersteller  'Paul_Germain_Joe_Ansolabehere :jahr '1997 :titel 'Disneys_Große_Pause :produktion 'Walt_Disney_Television_Animation :genre 'Dramedy :altersfreigabe 'FSK0 :plattform 'ABC :nummerfolge '1)
  )

;;TODO alle Angaben einfügen
(define (makeYtVideo)
  (make YTVideo  :ersteller 'Brayden_Holness :jahr '2019 :monat 'Juni  :titel 'Spending_Over_$1000_to_RENEW_my_Annual_Pass_for_Walt_Disney_World :kanal 'Mickey_Views-All_Things_Disney_News :videolink "https://www.youtube.com/watch?v=TDnBjVGv5eQ")
  )

;;;;;;1.2
;;generic-append-combination sorgt dafür, dass beim citen die spezifischeren Informationen denen der Übergeordneten Klasse hinzugefügt werden
(defgeneric cite ((v Video))
  :combination generic-append-combination
  )

;;TODO alle Argumente in citelist einfügen 
(defmethod cite ((v Video))
  (list (schluessel v)(ersteller v)(jahr v)(titel v))
  )

;;TODO alle Argumente in citelist einfügen 
(defmethod cite ((f Film))
    (list (produktion f)(regisseur f)(genre f)(altersfreigabe f))
  )

;;TODO alle Argumente in citelist einfügen 
(defmethod cite ((s Serie))
    (list (plattform s)(nummerfolge s))
  )

;;TODO alle Argumente in citelist einfügen 
(defmethod cite ((y YTVideo))
    (list (kanal y)(monat y)(videolink y))
  )


;;Aufgabe 2

(defclass tier ()
   (geschwindigkeit
    :initvalue 10
    :initarg :Igeschwindigkeit
    :reader get_geschwindigkeit
    :writer set_geschwindigkeit)
  (gefährlichkeit
   :initvalue 1
    :initarg :Igefährlichkeit
    :reader get_gefährlichkeit
    :writer set_gefährlichkeit)
  )

(defclass landtier (tier)
  (geschwindigkeit
    :initvalue 70)
  (gefährlichkeit
   :initvalue 70)
  )

(defclass meerestier (tier)
(geschwindigkeit
    :initvalue 50)
  )

(defclass flugtier (tier)
(geschwindigkeit
    :initvalue 100)
  )

(defclass arboreal (landtier)

  )

(defclass saxicolous (landtier)

  )

(defclass arenicolous (landtier)

  )

(defclass troglofauna (landtier)

  )

(defclass amphibie (meerestier landtier )

  )

(defclass tierWieLibelle (flugtier landtier meerestier)

  )

(defclass flugfähigesLandtier (landtier flugtier)

  )

(defclass fantasieFisch (meerestier flugtier)

  )

(defgeneric* getLebensraum ((ti tier))
 :combination generic-and-combination
  )

(defgeneric* getMaximalgeschwindigkeit ((ti tier))
  :combination generic-max-combination
  )

(defgeneric* getGefährlichkeit ((ti tier))
  :combination generic-max-combination
  )

(defgeneric* getNahrungsverbrauch ((ti tier))
 :combination generic-max-combination
  )


(defgeneric* getLebenserwartung ((ti tier))
 :combination generic-max-combination
  )

(defmethod getMaximalgeschwindigkeit ((ti tier))
  (get_geschwindigkeit ti)
  )

(defmethod getGefährlichkeit((ti tier))
  (
   (get_gefährlichkeit ti)
   )
  )


;;Flugtiere sind immer gefährlich, ihnen kann man nicht trauen
(defmethod getGefährlichkeit ((ti flugtier))
  5
  )

;;Magische Fische sind immer ungefährlich
(defmethod getGefährlichkeit((magieTier fantasieFisch))
   0
  )