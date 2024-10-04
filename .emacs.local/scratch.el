; Declare a list
(defvar numbers
    '(1 2 3 4 5))

; Get the first element from the list
(defvar first
    (car numbers))

; Get the remainding of the list except the first element
(defvar remainding
    (cdr numbers))

; Cons
(defvar list1
    (cons 1 (cons 2 '())))

(defvar list2
    (cons 1 (cons 2 nil)))

(defvar list1-eq-list2
    (equal list1 list2))

; map list
(defvar incremented
    (mapcar #'1+ numbers))

; same As
(defvar incremented2
    (mapcar (lambda (x) (+ 1 x)) numbers))