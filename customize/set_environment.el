;;========================================Environment========================================
;;----------encoding----------
(set-language-environment 'utf-8)
(prefer-coding-system 'utf-8)
(setq
 keyboard-coding-system 'utf-8
 coding-system-for-read 'utf-8
 coding-system-for-write 'utf-8
 file-name-coding-system 'utf-8
 locale-coding-system 'utf-8
)

;;----------term----------
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(setq shell-file-name "/bin/bash")
(global-set-key (kbd "C-c t") '(lambda ()
                                (interactive)
                                (term shell-file-name)))

;;----------auto-save----------
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

;;----------auto-backup----------
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

;;----------browser----------
(when (system-type-linux-p)
  (setq
   browse-url-browser-function 'browse-url-generic
   browse-url-generic-program "google-chrome"
   )
  )

;;----------我要退出----------
(global-set-key [C-S-f12] 'save-buffers-kill-emacs)
(define-prefix-command 'ctl-z-map)(global-set-key (kbd "C-z") 'ctl-z-map)
(define-key ctl-z-map (kbd "退出") 'save-buffer)
(define-key ctl-z-map (kbd "不是保存") 'save-buffer)
(define-key ctl-z-map (kbd "不是他妈的保存") 'kill-emacs)
