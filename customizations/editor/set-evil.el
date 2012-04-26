(require 'evil)
(evil-mode 1)
(eval-after-load "evil"
  '(progn
     (defun evil-undefine ()
       (interactive)
       (let (evil-mode-map-alist)
         (call-interactively (key-binding (this-command-keys)))))

     (define-key evil-normal-state-map "\C-r" 'isearch-backward)
     (define-key evil-normal-state-map "\C-e" 'end-of-line)
     (define-key evil-normal-state-map "\C-n" 'next-line)
     (define-key evil-normal-state-map "\C-p" 'previous-line)

     (define-key evil-insert-state-map "\C-k" 'evil-undefine)
     (define-key evil-insert-state-map "\C-r" 'evil-undefine)
     (define-key evil-insert-state-map "\C-e" 'evil-undefine)
     (define-key evil-insert-state-map "\C-n" 'evil-undefine)
     (define-key evil-insert-state-map "\C-p" 'evil-undefine)
     (define-key evil-insert-state-map "\C-y" 'evil-undefine)

     ;; viper-cua-region-fix
     ;; (define-key evil-normal-state-map [backspace] 'backward-delete-char-untabify)
     (define-key evil-insert-state-map [backspace] 'backward-delete-char-untabify)
     ;; (define-key viper-vi-global-user-map "\C-d" 'delete-char)
     ;; (define-key viper-insert-global-user-map "\C-d" 'delete-char)

     (setq evil-default-cursor '("LightBlue" box))
     ;; (setq evil-normal-state-cursor '("LightBlue" box))
     ;; (setq evil-insert-state-cursor '("LightBlue" box))
     ;; (setq evil-visual-state-cursor '("LightBlue" box))
     ;; (setq evil-motion-state-cursor '("LightBlue" box))
     ;; (setq evil-replace-state-cursor '("LightBlue" box))
     ;; (ksetq evil-operator-state-cursor '("LightBlue" box))
     (setq evil-emacs-state-cursor '("Red" box))
     ))

(provide 'set-evil)
