;;; init-print.el
;;
;; Author: Yagnesh Raghava Yakkala. http://yagnesh.org
;;    File: init-print.el
;; Created: Monday, May 21 2012

;;; Description:
;; ps print setup

(defun print-header-func ()
  (concat (ps-time-stamp-locale-default) " : " (ps-header-dirpart)))

(setq ps-bold-faces
      '(font-lock-keyword-face font-lock-function-name-face))

(setq ps-italic-faces
      '(font-lock-comment-face font-lock-string-face))

(setq ps-print-color-p t
      ps-spool-duplex t
      ps-switch-header nil
      ps-print-header t
      ps-print-footer nil
      ps-print-header-frame nil
      ps-header-offset 5.58001116
      ps-header-title-font-size '(10 . 12)
      ps-header-font-size '(7 . 8.5)
      ps-header-lines 1
      ps-left-header (list 'print-header-func))

(ps-extend-face '(default "black" nil nil) 'MERGE)

;;; init-print.el ends here