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

(define (tokenize-letter string pointer state history)
  (if (= state -1)
    #f
    (if (= pointer (string-length string))
      history
      (let ((transite-result (transite-letter-automaton-state string pointer state history)))
        (push! history (car transite-result))
        (tokenize-letter string (+ pointer 1) (cdr transite-result) history)))))

(define (tokenize-number string pointer state history)
  (if (= state -1)
    #f
    (if (= pointer (string-length string))
      history
      (let ((transite-result (transite-number-automaton-state string pointer state history)))
        (push! history (car transite-result))
        (tokenize-number string (+ pointer 1) (cdr transite-result) history)))))

(define (transite-letter-automaton-state string pointer state history)
  (let ((char (get-char string pointer)))
    (cond ((= state 0)
            (if (alphabet? char) (cons char 1) fail))
          ((= state 1)
            (if (alphabet? char) (cons char 1) fail))
          (else fail))))

(define (transite-number-automaton-state string pointer state history)
  (let ((char (get-char string pointer)))
    (cond ((= state 0)
            (if (one-to-nine? char) (cons char 1) fail))
          ((= state 1)
            (if (zero-to-nine? char) (cons char 1) fail))
          (else fail))))

(define (alphabet? char)
  (or (char=? char #\a)
      (char=? char #\b)
      (char=? char #\c)
      (char=? char #\d)
      (char=? char #\e)
      (char=? char #\f)
      (char=? char #\g)
      (char=? char #\h)
      (char=? char #\i)
      (char=? char #\j)
      (char=? char #\k)
      (char=? char #\l)
      (char=? char #\m)
      (char=? char #\n)
      (char=? char #\o)
      (char=? char #\p)
      (char=? char #\q)
      (char=? char #\r)
      (char=? char #\s)
      (char=? char #\t)
      (char=? char #\u)
      (char=? char #\v)
      (char=? char #\w)
      (char=? char #\x)
      (char=? char #\y)
      (char=? char #\z)))

(define (zero-to-nine? char)
  (or (char=? char #\0)
      (one-to-nine? char)))

(define (one-to-nine? char)
  (or (char=? char #\1)
      (char=? char #\2)
      (char=? char #\3)
      (char=? char #\4)
      (char=? char #\5)
      (char=? char #\6)
      (char=? char #\7)
      (char=? char #\8)
      (char=? char #\9)))

(define (get-char string pointer)
  (string-ref string pointer) )

(define fail (cons "" -1))
(define (fail? result) (= (cdr result) -1))

(print (tokenize-letter "abc" 0 0 (list))) ; success. return history
(print (tokenize-number "10" 0 0 (list))) ; success. return history
(print (tokenize-number "010" 0 0 (list))) ; fail
