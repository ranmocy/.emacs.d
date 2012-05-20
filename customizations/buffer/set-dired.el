(setq dired-omit-files "^\\...+$")      ; hide hidden files
(setq diredful-init-file (expand-file-name "diredful-conf.el" (file-name-directory file)))

(require 'dired-details)
(require 'diredful)

(add-hook 'dired-mode-hook
          '(lambda ()
             (local-set-key "(" 'dired-details-hide)
             (local-set-key ")" 'dired-details-show)
             (dired-omit-mode 1)
             ))

(provide 'set-dired)
