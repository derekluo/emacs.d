;; Always end a file with a newline
(setq require-final-newline t)

;; Stop at the end of the file, not just add lines
;(setq next-line-add-newlines nil)

;;save everything to a folder
(setq
backup-by-copying t ; don't clobber symlinks
backup-directory-alist
'(("." . "~/.emacs.d/auto-save-list")) ; don't litter my fs tree
delete-old-versions t
kept-new-versionhs 6
kept-old-versions 2
version-control t) ; use versioned backups


;(setq x-select-enable-clipboard nil); Ubuntu
;;
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

; (setq ispell-command "")
(setq text-mode-hook '(lambda ()
			(local-set-key "\M-\t" 'ispell-complete-word)))
(setq tex-mode-hook '(lambda ()
		       (local-set-key "\M-\t" 'ispell-complete-word)))
(setq latex-mode-hook '(lambda ()
			 (local-set-key "\M-\t" 'ispell-complete-word)))
(setq html-helper-mode-hook '(lambda ()
			       (local-set-key "\M-\t" 'ispell-complete-word)))
(setq ispell-enable-tex-parser t)

;; How do I stop Emacs from automatically editing my startup file?
(setq disabled-command-function nil)
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

(defalias 'yes-or-no-p 'y-or-n-p)


