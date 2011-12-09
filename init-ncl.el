;;; init-ncl.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. www.yagnesh.org
;; Author: Yagnesh Raghava Yakkala <yagnesh@live.com>
;;

;;; http://www.ncl.ucar.edu/Applications/editor.shtml
;; this line associates ncl-mode with the lisp package that defines it.

(autoload 'ncl-mode "ncl" "ncl-mode for editing ncar graphics" t)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/el-get/ncl/dict")

(setq auto-mode-alist (cons '("\.ncl$" . ncl-mode) auto-mode-alist))
(require 'ncl-doc)

(setq ncl-startup-message nil)

;;; (add-hook 'ncl-mode-hook 'ncl-doc)

;;; imenu support for ncl-mode
(setq ncl-imenu-generic-expression
      '(("functions" "^[[:blank:]]*function[[:blank:]]+\\(.*\\)(.*)" 1)
        ("procedures" "^[[:blank:]]*procedure[[:blank:]]+\\(.*\\)(.*)" 1)))

(add-hook 'ncl-mode-hook
          (lambda ()
            (setq imenu-generic-expression ncl-imenu-generic-expression)))

;;; init-ncl.el ends here
