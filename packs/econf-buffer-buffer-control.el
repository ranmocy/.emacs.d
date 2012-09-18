;;----------buffer-control----------
(global-set-key (kbd "s-`") 'other-window)
(when (system-type-p :unixlike)
  (global-set-key (kbd "s-d") 'dired)
  (global-set-key (kbd "s-b") 'ibuffer)
  (global-set-key (kbd "s-w") 'kill-this-buffer-unless-some)
  (global-set-key (kbd "s-q") 'delete-frame)
  (global-set-key [C-escape] 'kill-this-buffer)
  (global-set-key (kbd "s-<backspace>") 'kill-this-buffer)
  )
;; you can modify that list, to fit your needs
(setq protected-buffer-list '("*scratch*" "#emacs" "*Messages*" "irc.freenode.net:6667"))
(defun kill-this-buffer-unless-some ()
  (interactive)
  (if (member (buffer-name (current-buffer)) protected-buffer-list)
      (bury-buffer)
    (kill-buffer (current-buffer))))

(provide 'econf-buffer-buffer-control)
