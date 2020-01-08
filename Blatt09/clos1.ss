#lang swindle
(require swindle/setf swindle/misc )

(defclass tier ()

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