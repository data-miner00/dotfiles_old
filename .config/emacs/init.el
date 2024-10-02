(setq inhibit-startup-message t         ; Don't show the splash screen
      visible-bell t)                   ; Flash when the bell rings

(tool-bar-mode -1)                      ; Disable toolbar
(scroll-bar-mode -1)                    ; Disable scrollbar
(menu-bar-mode -1)                      ; Disable menu bar
(column-number-mode 1)
(show-paren-mode 1)

(global-display-line-numbers-mode 1)    ; Enable line numbers

(load-theme 'modus-vivendi t)           ; Load Modus Vivendi dark theme
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(tango)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(defun mp-elisp-mode-eval-buffer ()
  (interactive)
  (message "Evaluated buffer")
  (eval-buffer))

(define-key emacs-lisp-mode-map (kbd "C-c C-c") #'mp-elisp-mode-eval-buffer)
(define-key lisp-interaction-mode-map (kbd "C-c C-c") #'mp-elisp-mode-eval-buffer)

(defun hello()
  (message "hello, world"))