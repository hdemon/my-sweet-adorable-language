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

(define (real-number-dfa current-state input)
  (dfa current-state input state-transition-table-of-real-number))

(define (bracket-dfa current-state input)
  (dfa current-state input state-transition-table-of-bracket))
