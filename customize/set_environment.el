;;========================================环境========================================
;;----------编码设置----------
(set-language-environment 'utf-8)
(setq keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(setq coding-system-for-read 'utf-8)
(setq coding-system-for-write 'utf-8)

;;----------我要退出----------
(global-set-key [C-S-f12] 'save-buffers-kill-emacs)
(define-prefix-command 'ctl-z-map)(global-set-key (kbd "C-z") 'ctl-z-map)
(define-key ctl-z-map (kbd "退出") 'save-buffer)
(define-key ctl-z-map (kbd "不是保存") 'save-buffer)
(define-key ctl-z-map (kbd "不是他妈的保存") 'kill-emacs)

;;----------默认浏览器----------
(when (current-os-p 'linux)
  (setq browse-url-browser-function 'browse-url-generic browse-url-generic-program "google-chrome")
  )
