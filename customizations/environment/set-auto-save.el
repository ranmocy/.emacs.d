(if (system-type-unix-like-p)
    (setq autosave-dir (concat "/tmp/emacs_" (user-login-name) "/autosaves/"))
  (setq autosave-dir (concat temporary-file-directory "emacs_autosaves"))
  )
(make-directory autosave-dir t)
(setq
 ;; auto-save-default t
 ;; auto-save-file-name-transforms `((".*" ,temporary-file-directory t))
 ;; auto-save-file-name-transforms `((".*" ,autosave-dir))
 auto-save-file-name-transforms `(("\\(?:[^/]*/\\)*\\(.*\\)" ,(concat autosave-dir "\\1") t))
 )

(provide 'set-auto-save)
