(setq inhibit-startup-message t         ; Don't show the splash screen
      visible-bell t)                   ; Flash when the bell rings

(tool-bar-mode -1)                      ; Disable toolbar
(scroll-bar-mode -1)                    ; Disable scrollbar
(menu-bar-mode -1)                      ; Disable menu bar

(global-display-line-numbers-mode 1)    ; Enable line numbers

(load-theme 'modus-vivendi t)           ; Load Modus Vivendi dark theme
