;;--------------------Org-Mode--------------------
(require 'cl)

;; I open my gtd file when I hit C-c g
(defun gtd ()
  "Open the GTD file."
  (interactive)
  (find-file org-gtd-file))

;; Some basic keybindings.
(define-key 'run-map "g" 'gtd)
(define-key 'run-map "a" 'org-agenda)
(define-key 'run-map "b" 'org-iswitchb)
(define-key 'run-map "r" 'org-remember)
(define-key 'run-map "l" 'org-store-link)

;; Some projects need their own org files, but I still want them to
;; show up in my agenda.
;; (defvar org-gtd-other-files)
;; (setf org-gtd-other-files (list "~/todo.org"))
;; (setf org-agenda-files (cons org-gtd-file org-gtd-other-files))
(setf org-agenda-files org-gtd-file)

;; I put the archive in a separate file, because the gtd file will
;; probably already get pretty big just with current tasks.
(setq org-archive-location "%s_archive::")

;; Set up hook
(add-hook 'org-mode-hook 
          (lambda ()
            (setq truncate-lines t)
            (local-set-key "\M-n" 'outline-next-visible-heading)
            (local-set-key "\M-p" 'outline-previous-visible-heading)
            (local-set-key "\M-N" 'outline-forward-same-level)
            (local-set-key "\M-P" 'outline-backward-same-level)
            (local-set-key "\M-\C-n" 'outline-move-subtree-down)
            (local-set-key "\M-\C-p" 'outline-move-subtree-up)
            ;; table
            (local-set-key "\M-\C-w" 'org-table-copy-region)
            (local-set-key "\M-\C-y" 'org-table-paste-rectangle)
            (local-set-key "\M-\C-l" 'org-table-sort-lines)
            ;; display images
            (local-set-key "\M-I" 'org-toggle-inline-images)
            ;; fix tab
            (local-set-key "\C-y" 'yank)
            ;; yasnippet (allow yasnippet to do its thing in org files)
            (org-set-local 'yas/trigger-key [tab])
            (define-key yas/keymap [tab] 'yas/next-field-group)))



;; set different states
(setq org-todo-keywords '(
                          (sequence "TODO(t)" "WAITING(w!)" "NEXT(n!)" "DOING(i!)" "|" "DONE(d!)")
                          (sequence "|" "CANCELLED(c!)")
                          ))
;; I like to color-code task types.
(setf org-todo-keyword-faces '(
                               ("TODO" . (:foreground "cyan" :background "steelblue" :bold t :weight bold))
                               ("WAITING" . (:foreground "yellow" :background "magenta" :bold t :weight bold))
                               ("NEXT" . (:foreground "yellow" :background "red" :bold t :weight bold))
                               ("DONE" . (:foreground "gray50" :background "gray30"))
                               ))

;; Easy basic searches. Get a quick view of nextactions, etc
(setq org-agenda-custom-commands
      '(("w" todo "WAITING" nil)
        ("n" todo "NEXT" nil)
        ("d" "Agenda + Next Actions" ((agenda) (todo "NEXT")))))

;; I use org's tag feature to implement contexts.
(setq org-tag-alist '(
                      ("LIBRARY" . ?l)
                      ("COMPUTER" . ?c)
                      ;; ("MAIL" . ?m)
                      ;; ("HOME" . ?h)
                      ;; ("FIELD" . ?f) 
                      ("READING" . ?r)
                      ("MOVIE" . ?d)
                      ))

;;----------remember----------
(setq org-reverse-note-order t)  ;; note at beginning of file by default.
(setq org-default-notes-file "~/remember.org")
(setq remember-annotation-functions '(org-remember-annotation))
(setq remember-handler-functions '(org-remember-handler))
(add-hook 'remember-mode-hook 'org-remember-apply-template)

(setq org-remember-templates
      '((?t "* TODO %?\n  %i\n  %a" "~/todo.org")
        (?j "* %U %?\n\n  %i\n  %a" "~/journal.org")
        (?i "* %^{Title}\n  %i\n  %a" "~/remember.org" "New Ideas")))

;;----------misc----------
(setq org-return-follows-link t)
(setq org-hide-leading-stars t) 
(setf org-tags-column -65)
(setf org-special-ctrl-a/e t)

(setq org-log-done t)
(setq org-deadline-warning-days 1)
(setq org-fontify-emphasized-text t)
(setq org-fontify-done-headline t)
(setq org-agenda-include-all-todo nil)
(setq org-directory "~/")
(setq org-export-html-style "<link rel=stylesheet href=\"./org.css\" type=\"text/css\">")
(setq org-export-with-section-numbers nil)
(setq org-export-with-toc nil)
(setq org-adapt-indentation nil)

;; widen category field a little
(setq org-agenda-prefix-format "  %-17:c%?-12t% s") 

;; (provide 'set-org)
;;; org-gtd.el ends here
