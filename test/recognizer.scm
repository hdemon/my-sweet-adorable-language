(print (equal? (real-number? (list #\1 #\0)) #t))
(print (equal? (real-number? (list #\0 #\1)) #f))
(print (equal? (real-number? (list #\1 #\. #\2)) #t))
(print (equal? (real-number? (list #\1 #\. #\.)) #f))
(print (equal? (real-number? (list #\. #\1)) #f))
(print (equal? (real-number? (list #\a #\b)) #f))

(print (equal? (bracket? (list #\()) #t))
(print (equal? (bracket? (list #\))) #t))
(print (equal? (bracket? (list #\( #\))) #f))

(print (equal? (identifier? (list #\a #\b)) #t))
(print (equal? (identifier? (list #\0 #\a #\b)) #f))
(print (equal? (identifier? (list #\a #\b #\!)) #t))
(print (equal? (identifier? (list #\a #\! #\b)) #f))
(print (equal? (identifier? (list #\! #\a #\b)) #f))
