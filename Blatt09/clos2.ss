#lang swindle
(require swindle/setf swindle/misc )

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
    :writer set_getGefährlichkeit)
  )

(defclass landtier (tier)
  
  )

(defclass meerestier (tier)

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

(defclass amphibie ( meerestier landtier)

  )

(defclass tierWieLibelle (flugtier landtier meerestier)

  )

(defclass flugfähigesLandtier (landtier flugtier)

  )

(defclass fantasieFisch (meerestier flugtier)

  )

(defgeneric* getLebensraum ((ti tier))

  )

(defgeneric* getMaximalgeschwindigkeit ((ti tier))

  )

(defgeneric* getGefährlichkeit ((ti tier))

  )

(defgeneric* getNahrungsverbrauch ((ti tier))

  )


(defgeneric* getLebenserwartung ((ti tier))

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