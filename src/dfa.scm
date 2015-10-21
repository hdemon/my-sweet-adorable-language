(define (get-next-state state-transition-table current-state input)
  (nth (car (nth (state-transition-table) (+ 1 current-state))) ; リストの0番目は入力リストだから
    (get-list-index (car (state-transition-table)) input)))

(define (state-transition-table-of-number)
  (list       (list #\0 #\1 #\2 #\3 #\4 #\5 #\6 #\7 #\8 #\9 #\.)
        (cons (list ()  1   1   1   1   1   1   1   1   1   () ) #f)
        (cons (list 1   1   1   1   1   1   1   1   1   1   2  ) #t)
        (cons (list 2   2   2   2   2   2   2   2   2   2   () ) #t)))

(define (get-list-index list element)
  (if (char=? (car list) element)
    0
    (let ((result (get-list-index (cdr list) element)))
      (if (= result -1)
        -1
        (+ 1 result)))))

(define (nth list number)
  (if (= number 0)
      (car list)
      (nth (cdr list) (- number 1)) ))

(define (real-number-dfa current-state input)
  (dfa current-state input state-transition-table-of-number))

(define (dfa current-state input state-transition-table)
  (let ((next-state (get-next-state state-transition-table current-state (car input))))
    (if (null? next-state)
      #f
      (if (null? (cdr input))
        (cdr (nth (state-transition-table) (+ 1 next-state)))
        (dfa next-state (cdr input) state-transition-table)))))
