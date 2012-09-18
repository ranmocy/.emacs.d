(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(setq shell-file-name "/bin/bash")
(global-set-key (kbd "C-c t")
                '(lambda ()
                   (interactive)
                   (term shell-file-name)))

(provide 'econf-env-term)
