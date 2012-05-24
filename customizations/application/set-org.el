;;--------------------Org-Mode--------------------
(require 'cl)
(require 'org-bookmark)

;; Define custom

(cond
 ((system-type-unix-like-p)
  (setq my/org-directory "~/Documents/Org/")
  )
 (t
  (setq my/org-directory nil))
 )
(setq my/org-gtd-file (expand-file-name "gtd.org" my/org-directory))
(setq my/org-todo-file (expand-file-name "todo.org" my/org-directory))
(setq my/org-journal-file (expand-file-name "journal.org" my/org-directory))
(setq my/org-remember-file (expand-file-name "remember.org" my/org-directory))

;; Just open my gtd file.
(defun gtd ()
  "Open the GTD file."
  (interactive)
  (find-file my/org-gtd-file))
(global-set-key "\C-cg" 'gtd)

;; TODO
;; (add-hook 'org-mode-hook
;;           '(lambda ()
;;              (define-prefix-command 'org-mode-map)
;;              (local-set-key (kbd "C-`") 'org-mode-map)
;;              (define-key 'org-mode-map "a" 'org-agenda)
;;              (define-key 'org-mode-map "b" 'org-iswitchb)
;;              (define-key 'org-mode-map "r" 'org-remember)
;;              (define-key 'org-mode-map "l" 'org-store-link)
;;              ))

;; agenda-files
(setq org-agenda-files (list my/org-gtd-file my/org-todo-file my/org-remember-file))
 
;; Archive in a separate file
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
(setq org-todo-keywords
      '(
        (sequence "TODO(t)" "WAITING(w!)" "NEXT(n!)" "DOING(i!)" "|" "DONE(d!)")
        (sequence "|" "CANCELLED(c!)")
        ))
;; I like to color-code task types.
(setf org-todo-keyword-faces
      '(
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
(setq org-tag-alist
      '(
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
(setq org-default-notes-file my/org-remember-file)
(setq remember-annotation-functions '(org-remember-annotation))
(setq remember-handler-functions '(org-remember-handler))
(add-hook 'remember-mode-hook 'org-remember-apply-template)

(setq org-remember-templates
      '((?t "* TODO %?\n  %i\n  %a" my/org-todo-file)
        (?j "* %U %?\n\n  %i\n  %a" my/org-journal-file)
        (?i "* %^{Title}\n  %i\n  %a" my/org-remember-file "New Ideas")))

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
(setq org-directory my/org-directory)
(setq org-export-html-style "<link rel=stylesheet href=\"./org.css\" type=\"text/css\">")
(setq org-export-with-section-numbers nil)
(setq org-export-with-toc nil)
(setq org-adapt-indentation nil)

;; widen category field a little
(setq org-agenda-prefix-format "  %-17:c%?-12t% s")

(provide 'set-org)
;;; org-gtd.el ends here
