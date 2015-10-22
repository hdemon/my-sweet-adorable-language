(define (real-number-recognizer current-state input)
  (dfa current-state input state-transition-table-of-real-number))

(define (bracket-recognizer current-state input)
  (dfa current-state input state-transition-table-of-bracket))
