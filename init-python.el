;;; init-python.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. www.yagnesh.org
;;    File: init-python.el
;; Created: Friday, July 22 2011
;; License: GPL v3 or later. You should get a copy from <http://www.gnu.org/licenses/gpl.html>

;;; Description:

(add-to-list 'load-path  "~/.emacs.d/el-get/python-mode")

;;; --------------------------------------------------------------------
;; PYTHON-MODE.EL
(setq py-install-directory  "~/.emacs.d/el-get/python-mode")
(require 'python-mode)

;;; --------------------------------------------------------------------
;; PYLOOKUP

(setq pylookup-dir "~/.emacs.d/el-get/pylookup")
(add-to-list 'load-path pylookup-dir)

;; load pylookup when compile time
(require 'pylookup)

;; set executable file and db file
(setq pylookup-program
      (concat pylookup-dir "/pylookup.py"))
(setq pylookup-db-file
      (concat pylookup-dir "/pylookup.db"))

;; to speedup, just load it on demand
(autoload 'pylookup-lookup "pylookup"
  "Lookup SEARCH-TERM in the Python HTML indexes." t)

(autoload 'pylookup-update "pylookup"
  "Run pylookup-update and create the database at `pylookup-db-file'." t)

(add-hook 'python-mode-hook
          (lambda ()
            (local-set-key (kbd "C-z C-l") 'pylookup-lookup)
            (local-set-key (kbd "C-z C-s") 'pylookup-lookup-at-point)))

;;; init-python.el ends here
