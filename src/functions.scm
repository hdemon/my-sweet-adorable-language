(define (get-list-index list element)
  (if (char=? (car list) element)
    0
    (let ((result (get-list-index (cdr list) element)))
      (if (= result -1)
        -1
        (+ 1 result)))))

(define (get-list-index-contains-list list element)
  (if (null? list)
    0
    (if (contain? element (car list))
      0
      (let ((result (get-list-index-contains-list (cdr list) element)))
        (if (= result -1)
          -1
          (+ 1 result))))))

(define (contain? char char-list)
  (if (null? char-list)
    #f
    (if (char=? (car char-list) char)
      #t
      (contain? char (cdr char-list)))))

(define (nth list number)
  (if (null? list)
    ()
    (if (= number 0)
        (car list)
        (nth (cdr list) (- number 1)))))
