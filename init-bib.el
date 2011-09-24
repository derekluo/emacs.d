;;; init-bib.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
;;    File: init-bib.el
;;  Author: Yagnesh Raghava Yakkala <yagnesh@NOSPAM.live.com>
;; Created: Sunday, September  4 2011
;; License: GPL v3 or later. You should get a copy from <http://www.gnu.org/licenses/gpl.html>

;;; Description:
;; managing bibliography modes

(autoload 'ebib "ebib" "Ebib, a BibTeX database manager." t)
(add-hook 'LaTeX-mode-hook #'(lambda ()
                               (local-set-key "\C-cb" 'ebib-insert-bibtex-key)))

(setq-default
 ebib-file-search-dirs '("~/git/bib/")
 ebib-insertion-commands                ; which cite commands you wanna use
 '(("cite" 1 nil) ("citep" 1 nil) ("citet" 1 nil))
 ebib-preload-bib-files '("~/git/bib/cld.bib" "~/git/bib/jrShortname.bib" "~/git/bib/jrFullname.bib")
 )

(provide 'init-bib)
;;; init-bib.el ends here
