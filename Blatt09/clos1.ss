#lang swindle
(require swindle/setf
swindle/misc)

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

(defclass Serie (Video)
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

