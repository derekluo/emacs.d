;; -----------------------------------------------------------------------------
;; Essential minors, Change Default behavior 
;; -----------------------------------------------------------------------------

;; put off menu bar scroll bar
(scroll-bar-mode -1)
(menu-bar-mode -1)

;; minor modes
(tool-bar-mode -1)
(column-number-mode 1)
(blink-cursor-mode -1)
;(global-linum-mode 1)
(setq visible-bell t)
(show-paren-mode 1)
(display-battery-mode 1)
(setq show-paren-delay 0)

(provide 'init-ess-minors)
