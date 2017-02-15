(define (real-number-recognizer input)
  (dfa state-transition-table-of-real-number input))

(define (bracket-recognizer input)
  (dfa state-transition-table-of-bracket input))

(define (identifier-recognizer input)
  (dfa state-transition-table-of-identifier input))
