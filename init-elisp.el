;;; init-elisp.el
;; http://yagnesh.org

;;; elisp setup

(defun set-up-hippie-expand-for-elisp ()
  (make-variable-buffer-local 'hippie-expand-try-functions-list)
  (add-to-list 'hippie-expand-try-functions-list 'try-complete-lisp-symbol t)
  (add-to-list 'hippie-expand-try-functions-list 'try-complete-lisp-symbol-partially t))

(dolist (hook '(emacs-lisp-mode-hook ielm-mode-hook))
  (add-hook hook 'pretty-lambdas)
  (add-hook hook 'set-up-hippie-expand-for-elisp)
  (add-hook hook 'turn-on-eldoc-mode)
  (add-hook hook 'enable-paredit-mode))

(add-hook 'minibuffer-setup-hook 'conditionally-enable-paredit-mode)
(defun conditionally-enable-paredit-mode ()
  "Enable paredit-mode during eval-expression"
  (if (eq this-command 'eval-expression)
      (paredit-mode 1)))

(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-to-list 'auto-mode-alist '("\\.emacs-project$" . emacs-lisp-mode))

(require 'find-func)
(find-function-setup-keys)

;;; By Jumbunathan on org-mode list
(global-set-key (kbd "C-c f")
                (lambda ()
                  (interactive)
                  (require 'finder)
                  (let ((thing (intern (thing-at-point 'symbol))))
                    (if (functionp thing)
                        (find-function thing)
                      (find-variable thing)))))

;;; http://stackoverflow.com/a/9620373/399964
(defun locate-feature (feature)
  "Return file name as string where `feature' was provided"
  (interactive "Sfeature: ")
  (dolist (file-info load-history)
    (mapc (lambda (element)
            (when (and (consp element)
                       (eq (car element) 'provide)
                       (eq (cdr element) feature))
              (when (called-interactively-p 'any)
                (message "%s defined in %s" feature (car file-info)))
              (return (car file-info))))
          (cdr file-info))))

(defun locate-function (func)
  "Return file-name as string where `func' was defined or will be autoloaded"
  (interactive "Ccommand: ")
  (let ((res (find-lisp-object-file-name func (symbol-function func))))
    (when (called-interactively-p 'any)
      (message "%s defined in %s" func res))
    res))


;;; init-elisp.el ends here