;;; init-lisp.el
;; Copyright (C) Yagnesh Raghava Yakkala. www.yagnesh.org
;; Author: Yagnesh Raghava Yakkala <yagnesh@live.com>
;; Licence: GPL v3 or later

;; pretty lambda (see also slime) ->  "λ"
;;  'greek small letter lambda' / utf8 cebb / unicode 03bb -> \u03BB / mule?!
;; in greek-iso8859-7 -> 107  >  86 ec
(defun pretty-lambdas ()
  (font-lock-add-keywords
   nil `(("(\\(lambda\\>\\)"
          (0 (progn (compose-region (match-beginning 1) (match-end 1)
                                    ,(make-char 'greek-iso8859-7 107))
                    'font-lock-keyword-face))))))

(autoload 'paredit-mode "paredit"
  "Minor mode for pseudo-structurally editing Lisp code." t)
(autoload 'enable-paredit-mode "paredit" "Turn on paredit mode" t)

(defadvice enable-paredit-mode (before disable-autopair activate)
  (setq autopair-dont-activate t)
  (autopair-mode -1))

(dolist (hook '(emacs-lisp-mode-hook ielm-mode-hook))
  (add-hook hook 'pretty-lambdas)
  (add-hook hook 'enable-paredit-mode))


(add-hook 'minibuffer-setup-hook 'conditionally-enable-paredit-mode)
(defun conditionally-enable-paredit-mode ()
  "Enable paredit-mode during eval-expression"
  (if (eq this-command 'eval-expression)
      (paredit-mode 1)))


(defun set-up-hippie-expand-for-elisp ()
  (make-variable-buffer-local 'hippie-expand-try-functions-list)
  (add-to-list 'hippie-expand-try-functions-list 'try-complete-lisp-symbol t)
  (add-to-list 'hippie-expand-try-functions-list 'try-complete-lisp-symbol-partially t))


(defun maybe-map-paredit-newline ()
  (unless (or (eq major-mode 'inferior-emacs-lisp-mode) (minibufferp))
    (local-set-key (kbd "RET") 'paredit-newline)))

(add-hook 'paredit-mode-hook 'maybe-map-paredit-newline)

(dolist (hook '(emacs-lisp-mode-hook ielm-mode-hook))
  (add-hook hook 'set-up-hippie-expand-for-elisp)
;  (add-hook hook 'set-up-ac-for-elisp)
  (add-hook hook 'turn-on-eldoc-mode))

(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)

(add-to-list 'auto-mode-alist '("\\.emacs-project$" . emacs-lisp-mode))

(defun warn-disabled-command ()
  (interactive)
  (message "Command disabled")
  (ding))

(eval-after-load "paredit"
  '(progn
     ;; These are handy everywhere, not just in lisp modes
     (global-set-key (kbd "M-(") 'paredit-wrap-round)
     (global-set-key (kbd "M-[") 'paredit-wrap-square)
     (global-set-key (kbd "M-{") 'paredit-wrap-curly)

     (global-set-key (kbd "M-)") 'paredit-close-round-and-newline)
     (global-set-key (kbd "M-]") 'paredit-close-square-and-newline)
     (global-set-key (kbd "M-}") 'paredit-close-curly-and-newline)

     (global-set-key (kbd "C-<right>") 'paredit-forward-slurp-sexp)
     (global-set-key (kbd "C-<left>") 'paredit-forward-barf-sexp)
     (global-set-key (kbd "C-M-<left>") 'paredit-backward-slurp-sexp)
     (global-set-key (kbd "C-M-<right>") 'paredit-backward-barf-sexp)

     ;; Disable kill-sentence, which is easily confused with the kill-sexp
     ;; binding, but doesn't preserve sexp structure
;;     (define-key paredit-mode-map (kbd "M-K") 'warn-disabled-command)
;;     (define-key paredit-mode-map (kbd "M-k") 'warn-disabled-command)
     ))

;; When editing lisp code, highlight the current sexp
(add-hook 'paredit-mode-hook (lambda () (progn
				     (require 'hl-sexp)
				     (hl-sexp-mode t))))

(provide 'init-lisp)

;;; init-lisp.el ends here
