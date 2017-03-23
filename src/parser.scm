(define (parse string)
  (_parse (append (string->list string) (list #\$)) 1 1 ()))

(define (_parse string-list cursor-start cursor-end token-list)
  (if (and (> cursor-start (length string-list)) (> cursor-end (length string-list)))
    token-list
    (if (<= cursor-end (length string-list))
      (if (real-number? (between string-list cursor-start cursor-end))
        (if (real-number? (between string-list cursor-start (+ cursor-end 1)))
          (_parse string-list cursor-start (+ cursor-end 1) token-list)
          (append token-list (list "real" (list->string (between string-list cursor-start cursor-end))))
        (_parse string-list cursor-start (+ cursor-end 1) token-list)
      token-list)))

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
