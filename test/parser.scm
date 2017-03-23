(print (equal? (parse "1234") (list "real" "1234")))
(print (equal? (parse "(+ 1 2)")
  (list "function" "plus" "1" "2")))
