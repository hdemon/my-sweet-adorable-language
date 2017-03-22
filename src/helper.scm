(define (real-number? input)
  (dfa state-transition-table-of-real-number input))

(define (bracket? input)
  (dfa state-transition-table-of-bracket input))

(define (identifier? input)
  (dfa state-transition-table-of-identifier input))

;(between (list 1 2 3 4 5 6) 3 5) -> (3 4 5)
(define (between _list start end)
  (if (>= (length _list) end)
    (take (drop _list (- start 1)) (- (+ end 1) start))
    ()))
