(require 'dired-details)
(require 'diredful)
(setq dired-omit-files "^\\...+$")      ; hide hidden files

(add-hook 'dired-mode-hook
          '(lambda ()
             (local-set-key "(" 'dired-details-hide)
             (local-set-key ")" 'dired-details-show)
             (dired-omit-mode 1)
             ))

(provide 'set-dired)
