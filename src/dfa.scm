(define (get-next-state state-transition-table current-state-index input)
  (nth (get-state-row state-transition-table current-state-index)
    (get-list-index-contains-list (car (state-transition-table)) input)))

(define (get-state-row state-transition-table current-state-index)
  (car (nth (state-transition-table) (+ 1 current-state-index)))) ; リストの0番目は入力リストだから
