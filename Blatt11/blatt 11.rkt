#lang scheme
(require se3-bib/prolog/prologInScheme)
#|
1.1
a) geht nicht
b) ?A = 3 + 2
c) ?A = 3 + 2
d) ?A = 3 + 2
e) ?X = 1, ?B = 2, ?Rest = (?B ?X)
f) ?X = 1, ?B = 2, ?Y = 1, ?Rest = (?B 1)
g) 
|#
(?- (= (1 ?B . ?Rest) (?X 2 ?B ?Y)) (= (?X 2 ?B . (1)) (?X 2 ?B ?Y)))
;(schueler Name ID Lieblingsfach)
(<-(schueler "Max" 0 4))
(<-(schueler "Laura" 1 2))
(<-(schueler "Timo" 2 0))
(<-(schueler "Gustav" 3 0))
(<-(schueler "Marie" 4 1))
;(note SchuelerID Fach Note)"
(<-(note 1 4 2))
(<-(note 2 0 1))
(<-(note 4 3 4))
(<-(note 3 4 2))
(<-(note 4 1 1))
;(fach ID Fach)
(<-(fach 0 "Mathe"))
(<-(fach 1 "Deutsch"))
(<-(fach 2 "Englisch"))
(<-(fach 3 "Physik"))
(<-(fach 4 "Chemie"))

(?- (schueler ?N ?SID ?) (fach ?FID "Chemie") (note ?SID ?FID 2))
(?- (fach ?FID "Chemie") (findall ?SID  (note ?SID ?FID 2) ?Li) (length ?Li ?L))
(?- (schueler ?N1 ? ?LF) (schueler ?N2 ? ?LF) (!= ?N1 ?N2))
(?- (schueler ?N1 ?FID ?) (note ?SID ? ?Note) (test (> ?Note 2)))
