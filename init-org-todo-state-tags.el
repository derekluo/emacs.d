;;; init-org-todo-state-tags.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. www.yagnesh.org
;; Author: Yagnesh Raghava Yakkala <yagnesh@live.com>
;; Licence: GPL v3 or later

;;;  TODO key words
(setq org-todo-keywords (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!/!)")
				(sequence "WAITING(w@/!)" "SOMEDAY(s!)" "|" "CANCELLED(c@/!)"))))


(setq org-todo-keyword-faces (quote (("TODO" :foreground "red" :weight bold)
				     ("NEXT" :foreground "blue" :weight bold)
				     ("DONE" :foreground "forest green" :weight bold)
				     ("WAITING" :foreground "yellow" :weight bold)
				     ("SOMEDAY" :foreground "goldenrod" :weight bold)
				     ("CANCELLED" :foreground "orangered" :weight bold)
				     ("OPEN" :foreground "magenta" :weight bold)
				     ("CLOSED" :foreground "forest green" :weight bold))))

;;; change state
(setq org-use-fast-todo-selection t)
(setq org-treat-S-cursor-todo-selection-as-state-change nil)

;;; ToDo state triggers 
(setq org-todo-state-tags-triggers
      (quote (("CANCELLED"
               ("CANCELLED" . t))
              ("WAITING"
               ("WAITING" . t))
              ("SOMEDAY"
               ("WAITING" . t))
              (done
               ("WAITING"))
              ("TODO"
               ("WAITING")
               ("CANCELLED"))
              ("NEXT"
               ("WAITING"))
              ("DONE"
               ("WAITING")
               ("CANCELLED")))))


(provide 'init-org-todo-state-tags)
;;; init-org-todo-state-tags.el ends here