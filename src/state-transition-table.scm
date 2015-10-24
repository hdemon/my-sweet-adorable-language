(define (state-transition-table-of-real-number) ; see http://regexper.com/#(%5B1-9%5D%5Cd*%7C0)(%5C.%5Cd%2B)%3F%0A
  (list       (list zero one-to-nine dot)
        (cons (list 2    1           () ) #f)   ; start
        (cons (list 1    1           4  ) #t)   ; one-to-nine
        (cons (list ()   ()          4  ) #t)   ; zero
        (cons (list 3    3           () ) #t)   ; digit
        (cons (list 5    5           () ) #f)   ; dot
        (cons (list 5    5           () ) #t))) ; digit

(define (state-transition-table-of-bracket)
  (list       (list bracket)
        (cons (list 1      ) #f)
        (cons (list ()     ) #t)))
