(define alphabet
  (list #\a #\b #\c #\d #\e #\f #\g #\h #\i #\j #\k #\l #\m #\n #\o #\p #\q #\r #\s #\t #\u #\v #\w #\x #\y #\z))

(define zero
  (list #\0))

(define dot
  (list #\.))

(define one-to-nine
  (list #\1 #\2 #\3 #\4 #\5 #\6 #\7 #\8 #\9))

(define zero-to-nine
  (append zero one-to-nine))
(define (get-next-state state-transition-table current-state input)
  (nth (car (nth (state-transition-table) (+ 1 current-state))) ; リストの0番目は入力リストだから
    (get-list-index-contains-list (car (state-transition-table)) input)))

(define (dfa current-state input state-transition-table)
  (let ((next-state (get-next-state state-transition-table current-state (car input))))
    (if (null? next-state)
      #f
      (if (null? (cdr input))
        (cdr (nth (state-transition-table) (+ 1 next-state)))
        (dfa next-state (cdr input) state-transition-table)))))
(define (get-list-index list element)
  (if (char=? (car list) element)
    0
    (let ((result (get-list-index (cdr list) element)))
      (if (= result -1)
        -1
        (+ 1 result)))))

(define (get-list-index-contains-list list element)
  (if (contain? element (car list))
    0
    (let ((result (get-list-index-contains-list (cdr list) element)))
      (if (= result -1)
        -1
        (+ 1 result)))))

(define (contain? char char-list)
  (if (null? char-list)
    #f
    (if (char=? (car char-list) char)
      #t
      (contain? char (cdr char-list)))))

(define (nth list number)
  (if (= number 0)
      (car list)
      (nth (cdr list) (- number 1)) ))
;<s_expression>  ::= <atomic_symbol>
;                  | "(" <s_expression> "." <s_expression> ")"
;                  | <list> .
;
;<_list>         ::= <s_expression> <_list>
;                  | <s_expression> .
;
;<list>          ::= "(" <s_expression> <_list> ")" .
;
;<atomic_symbol> ::= <letter> <atom_part> .
;
;<atom_part>     ::= <empty> | <letter> <atom_part> | <number> <atom_part> .
;
;<letter>        ::= "a" | "b" | "c" | "d" | "e" | "f" | "g" | "h" | "i" | "j"
;                  | "k" | "l" | "m" | "n" | "o" | "p" | "q" | "r" | "s" | "t"
;                  | "u" | "v" | "w" | "x" | "y" | "z" .
;
;<number>        ::= "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9" | "0" .
;
;<empty>         ::= " ".
(define (real-number-recognizer input)
  (dfa 0 input state-transition-table-of-real-number))

(define (bracket-recognizer input)
  (dfa 0 input state-transition-table-of-bracket))
(define (state-transition-table-of-real-number)
  (list       (list zero one-to-nine dot)
        (cons (list ()   1           () ) #f)
        (cons (list 1    1           2  ) #t)
        (cons (list 2    2           () ) #t)))
(print (boolean=? (real-number-recognizer (list #\1 #\0)) #t))
(print (boolean=? (real-number-recognizer (list #\0 #\1)) #f))
(print (boolean=? (real-number-recognizer (list #\1 #\. #\2)) #t))
(print (boolean=? (real-number-recognizer (list #\1 #\. #\.)) #f))
(print (boolean=? (real-number-recognizer (list #\. #\1)) #f))
