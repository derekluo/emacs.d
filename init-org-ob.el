;;; org-babel Setup

(append org-modules '(ob-python
                      ob-sh
                      ob-ditaa
                      ob-perl
                      ob-python
                      ob-plantuml
                      ob-gnuplot
                      ob-pl))

(setq org-ditaa-jar-path "~/.emacs.d/el-get/org-mode/contrib/scripts/ditaa.jar")
(add-hook 'org-babel-after-execute-hook 'org-display-inline-images)
(setq org-babel-load-languages (quote ((emacs-lisp . t)
                                       (dot . t)
                                       (ditaa . t)
                                       (octave . t)
                                       (perl . t)
                                       (python . t)
                                       (plantuml . t)
                                       (gnuplot . t)
                                       (sh . t))))

;; Do not prompt to confirm evaluation
;; This may be dangerous - make sure you understand the consequences
;; of setting this -- see the docstring for details
(setq org-confirm-babel-evaluate nil)
