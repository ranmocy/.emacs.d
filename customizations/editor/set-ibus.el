(when (system-type-linux-p)
  (require 'ibus)
  (global-set-key (kbd "C-\\") 'ibus-toggle)
  (ibus-define-common-key ?\C-\s nil)     ;Use C-SPC for Set Mark command
  (ibus-define-common-key ?\C-/ nil)      ;Use C-/ for Undo command
  (setq ibus-cursor-color '("yellow" "blue" "red")) ;Change cursor color depending on IBus status
  ;; Turn on ibus-mode automatically after loading .emacs
  (add-hook 'after-init-hook 'ibus-mode-on)
  (add-hook 'after-make-frame-functions
            (lambda (new-frame)
              (select-frame new-frame)
              (or ibus-mode (ibus-mode-on))))
  ;; Specific python2
  (setq ibus-python-shell-command-name "python2")
  )

(provide 'set-ibus)
