(define (recognizer input state-transition-table)
    (let ((stack (list)))
        (define (recurse current-state input state-transition-table)
                (push! stack (car input))
                (print stack)
            (let ((next-state (get-next-state state-transition-table current-state (car input))))
              (print (car input))
              (print (accept? next-state state-transition-table))
            ;  (print (null? (cdr input)))
              (if (null? next-state)
                stack
                (if (null? (cdr input))
                  stack
                  (recurse next-state (cdr input) state-transition-table)))))
          (recurse 0 input state-transition-table)))

(define (bracket-recognizer input)
  (dfa 0 input state-transition-table-of-bracket))
