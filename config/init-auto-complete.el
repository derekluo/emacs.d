;;; auto-complete mode

(require 'auto-complete)
(require 'auto-complete-config)
(global-auto-complete-mode t)
(setq ac-auto-start nil)
(setq ac-dwim t)
(define-key ac-completing-map (kbd "C-n") 'ac-next)
(define-key ac-completing-map (kbd "C-p") 'ac-previous)

(set-default 'ac-sources
             '(ac-source-dictionary
               ac-source-words-in-buffer
               ac-source-words-in-same-mode-buffers
               ac-source-words-in-all-buffer))

(dolist (mode '(emacs-lisp-mode
		magit-log-edit-mode log-edit-mode org-mode text-mode
		haml-mode sass-mode yaml-mode csv-mode espresso-mode
		haskell-mode html-mode nxml-mode sh-mode smarty-mode
		clojure-mode lisp-mode textile-mode markdown-mode
		tuareg-mode))
  (add-to-list 'ac-modes mode))


;; Exclude very large buffers from dabbrev
(defun smp-dabbrev-friend-buffer (other-buffer)
  (< (buffer-size other-buffer) (* 1 1024 1024)))

(setq dabbrev-friend-buffer-function 'smp-dabbrev-friend-buffer)


(provide 'init-auto-complete)
