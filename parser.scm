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

(define tokenize-letter
  (lambda (string pointer state history)
    (if (= state -1)
      #f
      (if (= pointer (string-length string))
        history
        (let ((transite-result (transite-letter-automaton-state string pointer state history)))
          (push! history (car transite-result))
          (tokenize-letter string (+ pointer 1) (cdr transite-result) history))
          ))))

(define tokenize-number
  (lambda (string pointer state history)
    (if (= state -1)
      #f
      (if (= pointer (string-length string))
        history
        (let ((transite-result (transite-number-automaton-state string pointer state history)))
        (print transite-result)
          (push! history (car transite-result))
          (tokenize-number string (+ pointer 1) (cdr transite-result) history))
          ))))

(define transite-letter-automaton-state
  (lambda (string pointer state history)
    (let ((char (get-char string pointer)))
      (if (or (= state 0) (= state 1))
        (cond ((char=? char #\a) (cons char 1))
              ((char=? char #\b) (cons char 1))
              ((char=? char #\c) (cons char 1))
              ((char=? char #\d) (cons char 1))
              ((char=? char #\e) (cons char 1))
              ((char=? char #\f) (cons char 1))
              ((char=? char #\g) (cons char 1))
              ((char=? char #\h) (cons char 1))
              ((char=? char #\i) (cons char 1))
              ((char=? char #\j) (cons char 1))
              ((char=? char #\k) (cons char 1))
              ((char=? char #\l) (cons char 1))
              ((char=? char #\m) (cons char 1))
              ((char=? char #\n) (cons char 1))
              ((char=? char #\o) (cons char 1))
              ((char=? char #\p) (cons char 1))
              ((char=? char #\q) (cons char 1))
              ((char=? char #\r) (cons char 1))
              ((char=? char #\s) (cons char 1))
              ((char=? char #\t) (cons char 1))
              ((char=? char #\u) (cons char 1))
              ((char=? char #\v) (cons char 1))
              ((char=? char #\w) (cons char 1))
              ((char=? char #\x) (cons char 1))
              ((char=? char #\y) (cons char 1))
              ((char=? char #\z) (cons char 1))
              (else (cons "" -1)))
        -1)
    )))

(define transite-number-automaton-state
  (lambda (string pointer state history)
    (let ((char (get-char string pointer)))
      (cond ((= state 0)
              (if (one-to-nine? char) (cons char 1) (cons "" -1)))
            ((= state 1)
              (if (zero-to-nine? char) (cons char 1) (cons "" -1)))
            ))))

(define zero-to-nine?
  (lambda (char)
    (or (char=? char #\0)
        (one-to-nine? char))))

(define one-to-nine?
  (lambda (char)
    (or (char=? char #\1)
        (char=? char #\2)
        (char=? char #\3)
        (char=? char #\4)
        (char=? char #\5)
        (char=? char #\6)
        (char=? char #\7)
        (char=? char #\8)
        (char=? char #\9))))

(define get-char
  (lambda (string pointer)
    (string-ref string pointer) ))

(print (tokenize-letter "abc" 0 0 (list))) ; return history
(print (tokenize-number "010" 0 0 (list))) ; fail
