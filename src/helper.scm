(define (real-number? input)
  (dfa state-transition-table-of-real-number input))

(define (bracket? input)
  (dfa state-transition-table-of-bracket input))

(define (identifier? input)
  (dfa state-transition-table-of-identifier input))
