(define lower-case-alphabet
  (list #\a #\b #\c #\d #\e #\f #\g #\h #\i #\j #\k #\l #\m #\n #\o #\p #\q #\r #\s #\t #\u #\v #\w #\x #\y #\z))

(define upper-case-alphabet
  (list #\A #\B #\C #\D #\E #\F #\G #\H #\I #\J #\K #\L #\M #\N #\O #\P #\Q #\R #\S #\T #\U #\V #\W #\X #\Y #\Z))

(define alphabet
  (append lower-case-alphabet upper-case-alphabet))

(define underscore
  (list #\_))

(define zero
  (list #\0))

(define dot
  (list #\.))

(define question
  (list #\?))

(define exclamation
  (list #\!))

(define bracket
  (list #\( #\)))

(define one-to-nine
  (list #\1 #\2 #\3 #\4 #\5 #\6 #\7 #\8 #\9))

(define zero-to-nine
  (append zero one-to-nine))
