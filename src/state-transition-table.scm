(define (state-transition-table-of-real-number) ; see http://regexper.com/#(%5B1-9%5D%5Cd*%7C0)(%5C.%5Cd%2B)%3F%0A
  (list       (list zero one-to-nine dot)
        (cons (list 2    1           () ) #f)   ; 0 start
        (cons (list 1    1           4  ) #t)   ; 1 one-to-nine
        (cons (list ()   ()          4  ) #t)   ; 2 zero
        (cons (list 3    3           () ) #t)   ; 3 digit
        (cons (list 5    5           () ) #f)   ; 4 dot
        (cons (list 5    5           () ) #t))) ; 5 digit

(define (state-transition-table-of-bracket)
  (list       (list bracket)
        (cons (list 1      ) #f)    ; 0
        (cons (list ()     ) #t)))  ; 1

(define (state-transition-table-of-identifier) ; http://regexper.com/#%5Ba-zA-Z_%5D%2B(%5C%3F%7C%5C!)%3F
  (list       (list (append alphabet underscore) question exclamation)
        (cons (list 1                            ()       ()         ) #f)    ; 0 start
        (cons (list 1                            2        3          ) #t)    ; 1 alphabet or underscore
        (cons (list ()                           ()       ()         ) #t)    ; 2 question
        (cons (list ()                           ()       ()         ) #t)))  ; 3 exclamation
