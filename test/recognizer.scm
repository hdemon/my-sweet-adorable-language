;(print (boolean=? (real-number-recognizer (list #\1 #\0)) #t))
;(print (boolean=? (real-number-recognizer (list #\0 #\1)) #f))
;(print (boolean=? (real-number-recognizer (list #\1 #\. #\2)) #t))
;(print (boolean=? (real-number-recognizer (list #\1 #\. #\.)) #f))
;(print (boolean=? (real-number-recognizer (list #\. #\1)) #f))

(print (recognizer (list #\1 #\2 #\3 #\. #\.) state-transition-table-of-real-number))
