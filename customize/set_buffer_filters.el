(setq ibuffer-filter-irc
      '("irc" (or
               (mode . rcirc-mode)
               )))
(setq ibuffer-filter-twitter
      '("twitter" (or
                   (name . ":home")
                   (name . ":mentions")
                   (name . ":replies")
                   (name . ":friends")
                   (mode . twittering-mode)
                   )))
(setq ibuffer-filter-gnus
      '("gnus" (or
                (mode . message-mode)
                (mode . bbdb-mode)
                (mode . mail-mode)
                (mode . gnus-group-mode)
                (mode . gnus-summary-mode)
                (mode . gnus-article-mode)
                (name . "^\\.bbdb$")
                (name . "^\\.newsrc-dribble")
                )))
(setq ibuffer-filter-emacs
      '("emacs" (or
                 (name . "^\\*scratch\\*$")
                 (name . "^\\*Messages\\*$")
                 (name . "^\\*Warnings\\*$")
                 (name . "^\\*Completions\\*$")
                 (name . "^\\*.*\\*$")
                 )))
(setq ibuffer-filter-planner
      '("planner" (or
                   (name . "^\\*Calendar\\*$")
                   (name . "^diary$")
                   (mode . muse-mode)
                   (mode . org-mode)
                   )))

 (defun tabbar-buffer-groups ()
   (list
    (cond
     ((string-equal "*" (substring (buffer-name) 0 1))
      '("Emacs Buffer")
      )
     ;; ((eq major-mode 'dired-mode)
     ;;  '("Dired")
     ;;  )
     (t
      '("Default")
      )
     )))
