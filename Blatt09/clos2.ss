#lang swindle
(require swindle/setf swindle/misc )

(defclass tier ()
   ((geschwindigkeit
    :initform 10)
  (gefährlichkeit
   :initform 1))
  )

(defclass landtier (tier)
  
  )

(defclass meerestier (tier)

  )

(defclass flugtier (tier)

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

(defmethod getMaximalgeschwindigkeit (ti tier)
  (geschwindigkeit ti)
  )