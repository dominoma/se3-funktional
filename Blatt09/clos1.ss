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
 :accessor alterfreigabe))

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

;;TODO alle Angaben einfügen
(define (makeMulan)
   (make Film :ersteller 'Chris_Bender' :produktion 'Walt_Disney_Pictures :genre 'abenteuer)
  )

;;TODO alle Angaben einfügen
(define (makeGroßePause)
  (make Serie :ersteller  'Paul_Germain_Joe_Ansolabehere :produktion 'Walt_Disney_Television_Animation)
  )

;;TODO alle Angaben einfügen
(define (makeYtVideo)
  (make YTVideo)
  )

;;;;;;1.2
;;generic-append-combination sorgt dafür, dass beim citen die spezifischeren Informationen denen der Übergeordneten Klasse hinzugefügt werden
(defgeneric cite ((v Video))
  :combination generic-append-combination
  )

;;TODO alle Argumente in citelist einfügen 
(defmethod cite ((v Video))
  (list (produktion v)(ersteller v))
  )

;;TODO alle Argumente in citelist einfügen 
(defmethod cite ((f Film))
    (list )
  )

;;TODO alle Argumente in citelist einfügen 
(defmethod cite ((s Serie))
    (list )
  )

;;TODO alle Argumente in citelist einfügen 
(defmethod cite ((y YTVideo))
    (list )
  )