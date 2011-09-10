;;; init-el-get.el
;; 
;; Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
;;    File: init-el-get.el
;;  Author: Yagnesh Raghava Yakkala <yagnesh@NOSPAM.live.com>
;; Created: 
;; Licence: GPL v3 or later. You should get a copy from <http://www.gnu.org/licenses/gpl.html>

;;; Description:
;;

;;from steves emacs.d git http://git.sanityinc.com/
(when (not (load "~/.emacs.d/el-get/el-get/el-get.el" t))
  (error
   "Please bootstrap el-get using the instructions here:
   http://github.com/dimitri/el-get/, then restart Emacs"))

(setq el-get-is-lazy 't)

;; compile at init if any source is not byte compiled
;; (setq el-get-byte-compile-at-init 't)

;;; ---------------------------------------------------------------------------
;; packages are defined by me
(setq el-get-sources
      '(
;;;; help typing
        (:name auto-complete
               :type git
               :url "git://github.com/m2ym/auto-complete.git")
        ))

;;; ---------------------------------------------------------------------------
;; COMMON packages all the systems I have
(setq my-packages
      (append
       '(
;;;; Basics
         ;; package24
         byte-code-cache

;;;; general

;;;; navigation
         smex
         dired-plus

;;;; help typing
         yasnippet
         ac-math
         ac-octave
         highlight-parentheses
         autopair

;;;; Cosmetics
         diminish
         boxquote

;;;; Org
         org-mode
         calfw
         epresent

;;;; DVC
         magit

;;;; langs
         ;; elisp
         paredit
         hl-sexp

         ;; python
         pymacs
         ;; ropemacs


;;;; Sub
         ncl
         emacs-grads
         gnuplot-mode

;;;; web & mail
         bbdb
         emacs-w3m
         yaoddmuse

;;; sys
         crontab-mode
         screenshot

;;;; misc
         profile-dotemacs
         el-get)
       (mapcar 'el-get-source-name el-get-sources)))

;;; ---------------------------------------------------------------------------
;; add these packages if I am not server
(when (not on-lab-server)
  (setq my-packages
        (append
         '(auctex
           ebib
           dictem
           markdown-mode
           haml-mode
           sass-mode
           yaml-mode)
         my-packages)))

;;; ---------------------------------------------------------------------------
;; package needed for only my laptop
(when on-laptop
  (setq my-packages
        (append
         '(emms textile-mode)
         my-packages)))

(el-get 'sync my-packages)

(provide 'init-el-get)
;; init-el-get.el ends here