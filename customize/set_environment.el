;;========================================Environment========================================
;;----------Encoding----------
(set-language-environment 'utf-8)
(prefer-coding-system 'utf-8)
(setq
 keyboard-coding-system 'utf-8
 coding-system-for-read 'utf-8
 coding-system-for-write 'utf-8
 )

;;----------Auto-Save----------
(defvar autosave-dir (concat "/tmp/emacs_" (user-login-name) "/autosaves/"))
(make-directory autosave-dir t)
(setq
 ;; auto-save-default t
 ;; auto-save-file-name-transforms `((".*" ,temporary-file-directory t))
 auto-save-file-name-transforms `((".*" ,autosave-dir))
 ;; auto-save-file-name-transforms `(("\\(?:[^/]*/\\)*\\(.*\\)" ,(concat autosave-dir "\\1") t))
 )

;;----------Auto-Backup----------
(defvar backup-dir (concat "/tmp/emacs_" (user-login-name) "/backups/"))
(make-directory backup-dir t)
(setq
 backup-by-copying t
 backup-directory-alist `((".*" . ,backup-dir))
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t
 )

;;----------Browser----------
(when (current-os-p 'linux)
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
