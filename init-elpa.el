(eval-after-load "package"
  '(when (> emacs-major-version 23)
     (setq package-archives (cons '("tromey" . "http://tromey.com/elpa/") package-archives))))
