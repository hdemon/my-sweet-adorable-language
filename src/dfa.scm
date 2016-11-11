(define (get-next-state state-transition-table current-state-index input)
  (nth (get-state-row state-transition-table current-state-index)
    (get-list-index-contains-list (car (state-transition-table)) input)))

(define (get-state-row state-transition-table current-state-index)
  (car (nth (state-transition-table) (+ 1 current-state-index)))) ; リストの0番目は入力リストだから

(define (match current-state input state-transition-table)
  (let ((matched (list)))
    (define (recurse current-state input index accepted-index)
      (let ((next-state (get-next-state state-transition-table current-state (car input))))
        (if (null? next-state)
          (take (reverse matched) accepted-index)
          (begin
            (push! matched (car input))
            (if (null? (cdr input))
              (take (reverse matched) (+ index 1))
              (recurse next-state (cdr input) (+ index 1) (if (accept? state-transition-table next-state) (+ index 1) accepted-index) ))))))
    (recurse current-state input 0 0)))
