(defun greet (&optional arg)
  "Ask for the user's name and greet them."
  (interactive)
  (let ((name (read-string "What is your name? ")))
    (message "Hello, %s!" name)))

(provide 'greet)