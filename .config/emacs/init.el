(setq inhibit-startup-message t         ; Don't show the splash screen
      visible-bell t)                   ; Flash when the bell rings

(tool-bar-mode -1)                      ; Disable toolbar
(scroll-bar-mode -1)                    ; Disable scrollbar
(menu-bar-mode -1)                      ; Disable menu bar
(column-number-mode 1)
(show-paren-mode 1)
(global-whitespace-mode)                ; whitespace-mode is for local buffers only

(global-display-line-numbers-mode 1)    ; Enable line numbers

(load-theme 'modus-vivendi t)           ; Load Modus Vivendi dark theme
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(tango))
 '(display-line-numbers-type 'relative))
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

(defun get-default-font ()
  (cond
    ((eq system-type 'windows-nt) "Cascadia Code-16")
    ((eq system-type 'gnu/linux) "Iosevka-20")))

(add-to-list 'default-frame-alist `(font . ,(get-default-font)))

(set-face-attribute 'default nil
                    :family (get-default-font) :height 100)

; Set default directory for `load-file`
(setq default-directory "D:/Workspace")

; Set new home directory variable
(setq home-directory  "C:/Users/User")

; Load individual file with absolute path
(load-file "~/.emacs.d/add.el")

; Add load path to search for Elisp module
(add-to-list 'load-path
  (concat home-directory "/.emacs.local"))

; Require modules
(require 'add)
(require 'greet)

(require 'cc)
(add-to-list 'auto-mode-alist '("\\.[hc]\\(pp\\)?\\'" . cc))