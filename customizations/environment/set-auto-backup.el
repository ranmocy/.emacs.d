(if (system-type-unix-like-p)
    (setq backup-dir (concat "/tmp/emacs_" (user-login-name) "/backups/"))
  (setq backup-dir (concat temporary-file-directory "emacs_backups"))
  )
(make-directory backup-dir t)
(setq
 backup-by-copying t
 backup-directory-alist `((".*" . ,backup-dir))
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t
 )

(provide 'set-auto-backup)
