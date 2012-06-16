(global-set-key [C-S-f12] 'save-buffers-kill-emacs)
(define-prefix-command 'ctl-z-map)
(global-set-key (kbd "C-z") 'ctl-z-map)
(define-key ctl-z-map (kbd "退出") 'save-buffer)
(define-key ctl-z-map (kbd "不是保存") 'save-buffer)
(define-key ctl-z-map (kbd "不是他妈的保存") 'kill-emacs)

(provide 'set-exit)
