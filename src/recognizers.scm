(define (real-number-recognizer input)
  (dfa 0 input state-transition-table-of-real-number))

(define (bracket-recognizer input)
  (dfa 0 input state-transition-table-of-bracket))
