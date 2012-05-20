(if (system-type-unix-like-p)
    (setq autosave-dir (concat "/tmp/emacs_" (user-login-name) "/autosaves/"))
  (setq autosave-dir (concat temporary-file-directory "emacs_autosaves"))
  )
(make-directory autosave-dir t)

(setq
 auto-save-default t
 auto-save-list-file-prefix (expand-file-name ".saveslist-" autosave-dir)
 auto-save-file-name-transforms `(("\\(?:[^/]*/\\)*\\(.*\\)" ,(concat autosave-dir "\\1") t))
 auto-save-interval 300
 auto-save-timeout 3
 trash-directory (expand-file-name "trash" autosave-dir)
 ;; auto-save-file-name-transforms `((".*" ,temporary-file-directory t))
 ;; auto-save-file-name-transforms `((".*" ,autosave-dir))
 )

(provide 'set-auto-save)
