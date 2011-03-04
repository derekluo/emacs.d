(when (not (load "~/.emacs.d/el-get/el-get/el-get.el" t)) ;;from steves emacs.d git http://git.sanityinc.com/
  (error "Please bootstrap el-get using the instructions here: http://github.com/dimitri/el-get/, then restart Emacs"))


(setq el-get-sources
      '(

;;;; Basics
	package
        hl-sexp

	(:name smex
	       :type git
	       :url "http://github.com/nonsequitur/smex.git")

	(:name dired-plus
	       :type git
	       :url "git://github.com/emacsmirror/dired-plus.git")
	
;;;; help typing
        auto-complete
	highlight-parentheses

	(:name auto-complete-octave
	       :type emacswiki)
	
	(:name autopair
	       :type git-svn
	       :url "http://autopair.googlecode.com/svn/trunk/")

	(:name yasnippet
	       :type git-svn
	       :url "http://yasnippet.googlecode.com/svn/trunk/")

;;;; Cosmetics
	(:name diminish
	       :type http
	       :url "http://www.eskimo.com/~seldon/diminish.el"
	       :features diminish)

;;;; Org
	(:name org-mode
	       :type git
	       :url "git://repo.or.cz/org-mode.git"
	       :info "doc"
	       :build ("make clean" "make" "make doc/org")
	       :after (lambda () 
			(setq load-path (remove "~/local/emacs-git/share/emacs/24.0.50/lisp/org" load-path)))
	       :load-path ("lisp" "contrib/lisp")
	       :features org-install)

;;;; Version control
	(:name magit
               :after (lambda () (global-set-key (kbd "C-x C-z") 'magit-status)))


;;;; langs
	;; html
	;; (:name nxhtml
	;;        :type git
	;;        :url "http://github.com/emacsmirror/nxhtml.git")
	
	;; lisp
        (:name paredit
	       :type http
	       :url "http://mumble.net/~campbell/emacs/paredit.el")

	;; latex
	(:name auctex
	       :type cvs
	       :module "auctex"
	       :url ":pserver:anonymous@cvs.sv.gnu.org:/sources/auctex"
	       :build ("./autogen.sh" "./configure" "make")
	       :load  ("auctex.el" "preview/preview-latex.el")
	       :info "doc")

	;;yaml-mode
	(:name yaml-mode
	       :type git
	       :url "git://github.com/yoshiki/yaml-mode.git"
	       :after (lambda ()
			(autoload 'yaml-mode "yaml-mode" nil t)
			(add-to-list 'auto-mode-alist '("\\.ya?ml\\'" . yaml-mode))))

;;;; web & mail
	(:name bbdb
	       :type git
	       :url "git://github.com/barak/BBDB.git"
	       :load-path ("./lisp" "./bits")
	       :build ("./configure" "make autoloads" "make")
	       :build/darwin ("./configure --with-emacs=/Applications/Emacs.app/Contents/MacOS/Emacs" "make autoloads" "make")
	       :features bbdb
	       :info "texinfo")

	(:name yaoddmuse
	       :type emacswiki)
	
	(:name emacs-w3m
	       :type cvs
	       :module "emacs-w3m"
	       :url ":pserver:anonymous@cvs.namazu.org:/storage/cvsroot"
	       :build ("autoconf" "./configure" "make")
	       :build/darwin ("autoconf" "./configure --with-emacs=/Applications/Emacs.app/Contents/MacOS/Emacs" "make")
	       :info "doc"
	       :features "w3m-load")

	;; textile-mode
	(:name textile-mode
	       :type http
	       :url "http://dev.nozav.org/scripts/textile-mode.el"
	       :post-init (lambda ()
			    (autoload 'textile-mode "textile-mode" "Textile editing mode." t)
			    (add-to-list 'auto-mode-alist '("\\.textile\\'". textile-mode))))

	;; markdown-mode
	(:name markdown-mode
	       :type git
	       :url "git://jblevins.org/git/markdown-mode.git"
	       :features markdown-mode
	       :post-init (lambda ()
			    (add-to-list 'auto-mode-alist
					 '("\\.\\(md\\|mdown\\|markdown\\)\\'" . markdown-mode))))
	

	;; haml-mode
	(:name haml-mode
	       :type git
	       :url "https://github.com/nex3/haml-mode.git"
	       :features haml-mode)
	
	;; sass mode
	(:name sass-mode
	       :type git
	       :url "https://github.com/nex3/sass-mode.git"
	       :features sass-mode)
	
;;;; extras
	(:name boxquote
	       :type git
	       :url "git://github.com/davep/boxquote.el.git"
	       :after (lambda () (require 'boxquote)))

	(:name multi-term
	       :type emacswiki)

	(:name profile-dotemacs
	       :type http
	       :url "http://www.randomsample.de/profile-dotemacs.el")
	
	(:name el-get
	       :type git
	       :url "git://github.com/dimitri/el-get.git"
	       :features el-get
	       :load    "el-get.el")))





(defun el-get-update-all ()
  "Update all el-get packages"
  (interactive)
  (dolist (package (mapcar 'el-get-source-name el-get-sources))
    (unless (memq (plist-get (el-get-package-def package) :type) '(http-tar elpa))
      (el-get-update package))))


;;
(el-get 'sync)
(provide 'init-el-get)
