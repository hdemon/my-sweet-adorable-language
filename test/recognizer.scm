(print (boolean=? (real-number-recognizer 0 (list #\1 #\0)) #t))
(print (boolean=? (real-number-recognizer 0 (list #\0 #\1)) #f))
(print (boolean=? (real-number-recognizer 0 (list #\1 #\. #\2)) #t))
(print (boolean=? (real-number-recognizer 0 (list #\1 #\. #\.)) #f))
(print (boolean=? (real-number-recognizer 0 (list #\. #\1)) #f))
