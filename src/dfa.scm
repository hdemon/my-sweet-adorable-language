(define (get-next-state state-transition-table current-state input)
  (nth (car (nth (state-transition-table) (+ 1 current-state))) ; リストの0番目は入力リストだから
    (get-list-index-contains-list (car (state-transition-table)) input)))
