(define (real-number-recognizer input)
  (match 0 input state-transition-table-of-real-number))

(define (bracket-recognizer input)
  (match 0 input state-transition-table-of-bracket))

(define (identifier-recognizer input)
  (match 0 input state-transition-table-of-identifier))
